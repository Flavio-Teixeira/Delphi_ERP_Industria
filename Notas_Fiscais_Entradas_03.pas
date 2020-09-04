unit Notas_Fiscais_Entradas_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TNotasFiscaisEntradas03 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Adiciona_Codigo_Produto: TEdit;
    Adiciona_Descricao: TEdit;
    Adiciona_Vlr_Total: TEdit;
    Adiciona_Quantidade: TEdit;
    Adiciona_Referencia: TEdit;
    Adiciona_Unidade: TEdit;
    Adiciona_IPI: TEdit;
    Label8: TLabel;
    Adiciona_CF: TEdit;
    Label9: TLabel;
    Adiciona_ST: TEdit;
    Label10: TLabel;
    Adiciona_Vlr_Unitario: TEdit;
    Label11: TLabel;
    Adiciona_Vlr_IPI: TEdit;
    Label12: TLabel;
    Adiciona_ICMS: TEdit;
    Programa_Anterior: TEdit;
    Nro_Fornecedor: TEdit;
    Adiciona_ARow: TEdit;
    Adiciona_Quantidade_Unidade: TEdit;
    Label13: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure Adiciona_Codigo_ProdutoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_ReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_CFKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_STKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_Vlr_UnitarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_Vlr_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_Vlr_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_QuantidadeExit(Sender: TObject);
    procedure Adiciona_Vlr_UnitarioExit(Sender: TObject);
    procedure Adiciona_Vlr_TotalExit(Sender: TObject);
    procedure Adiciona_ICMSExit(Sender: TObject);
    procedure Adiciona_IPIExit(Sender: TObject);
    procedure Adiciona_Vlr_IPIExit(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotasFiscaisEntradas03: TNotasFiscaisEntradas03;

implementation

uses Conexao_BD, Rotinas_Gerais, Notas_Fiscais_Entradas_01,
  Notas_Fiscais_Entradas_02;

{$R *.dfm}

procedure TNotasFiscaisEntradas03.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisEntradas03.Close;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Codigo_ProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_ReferenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_DescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_CFKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_STKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_QuantidadeKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Vlr_UnitarioKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Vlr_TotalKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Vlr_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_QuantidadeExit(Sender: TObject);
begin
     If Trim(Adiciona_Quantidade.Text) = '' Then
        Begin
        Adiciona_Quantidade.Text := '0';
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Vlr_UnitarioExit(
  Sender: TObject);
begin
     If Trim(Adiciona_Vlr_Unitario.Text) = '' Then
        Begin
        Adiciona_Vlr_Unitario.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Vlr_TotalExit(Sender: TObject);
begin
     If Trim(Adiciona_Vlr_Total.Text) = '' Then
        Begin
        Adiciona_Vlr_Total.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_ICMSExit(Sender: TObject);
begin
     If Trim(Adiciona_ICMS.Text) = '' Then
        Begin
        Adiciona_ICMS.Text := '0';
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_IPIExit(Sender: TObject);
begin
     If Trim(Adiciona_IPI.Text) = '' Then
        Begin
        Adiciona_IPI.Text := '0';
     End;
end;

procedure TNotasFiscaisEntradas03.Adiciona_Vlr_IPIExit(Sender: TObject);
begin
     If Trim(Adiciona_Vlr_IPI.Text) = '' Then
        Begin
        Adiciona_Vlr_IPI.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas03.BT_IncluirClick(Sender: TObject);

var
   Ind: Integer;

begin

     If( (Trim(Adiciona_Quantidade_Unidade.Text) = '0') or (Trim(Adiciona_Quantidade_Unidade.Text) = '') ) Then
        Begin
        MSG_Erro('A Quantidade em Unidades não foi Informada.');
        Adiciona_Quantidade_Unidade.SetFocus;
     End
     Else
        Begin
             //*** Inclusão ***

             If Trim(Programa_Anterior.Text) = 'Entrada-Inclusao' Then
                Begin
                If Trim(Adiciona_Quantidade.Text) = '0' Then
                   Begin
                   Ind := NotasFiscaisEntradas01.SGD_Produtos.RowCount;

                   NotasFiscaisEntradas01.SGD_Produtos.Cells[0, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[1, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[2, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[3, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[4, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[5, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[6, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[7, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[8, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[9, (Ind - 1)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[10,(Ind - 1)] := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[11,(Ind - 1)] := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[12,(Ind - 1)] := '';

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas01.SGD_Produtos.Refresh;
                   NotasFiscaisEntradas03.Close;
                   End
                Else
                   Begin
                   Ind := NotasFiscaisEntradas01.SGD_Produtos.RowCount;

                   NotasFiscaisEntradas01.SGD_Produtos.Cells[0, (Ind - 1)] := Adiciona_Codigo_Produto.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[1, (Ind - 1)] := Adiciona_Referencia.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[2, (Ind - 1)] := Adiciona_Descricao.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[3, (Ind - 1)] := Adiciona_CF.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[4, (Ind - 1)] := Adiciona_ST.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[5, (Ind - 1)] := Adiciona_Unidade.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[6, (Ind - 1)] := Adiciona_Quantidade.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[7, (Ind - 1)] := Adiciona_Quantidade_Unidade.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[8, (Ind - 1)] := Adiciona_Vlr_Unitario.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[9, (Ind - 1)] := Adiciona_Vlr_Total.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[10,(Ind - 1)] := Adiciona_ICMS.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[11,(Ind - 1)] := Adiciona_IPI.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[12,(Ind - 1)] := Adiciona_Vlr_IPI.Text;

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas01.SGD_Produtos.RowCount := Ind + 1;
                   NotasFiscaisEntradas01.SGD_Produtos.Row      := Ind - 1;
                   NotasFiscaisEntradas01.SGD_Produtos.Refresh;

                   Adiciona_Codigo_Produto.SetFocus;
                End;
                End
             Else If Trim(Programa_Anterior.Text) = 'Entrada-Inclusao-Alteracao' Then
                Begin
                If Trim(Adiciona_Quantidade.Text) = '0' Then
                   Begin
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := '';
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := '';

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas01.SGD_Produtos.Refresh;
                   NotasFiscaisEntradas03.Close;
                   End
                Else
                   Begin
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[0, StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[1, StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[2, StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[3, StrToInt(Adiciona_ARow.Text)] := Adiciona_CF.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[4, StrToInt(Adiciona_ARow.Text)] := Adiciona_ST.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[5, StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[6, StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[7, StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade_Unidade.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[8, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_Unitario.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[9, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_Total.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_ICMS.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
                   NotasFiscaisEntradas01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_IPI.Text;

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas01.SGD_Produtos.Refresh;
                   NotasFiscaisEntradas03.Close;
                End;
                End

             //*** Alteração ***

             Else If Trim(Programa_Anterior.Text) = 'Entrada-Alteracao' Then
                Begin
                If Trim(Adiciona_Quantidade.Text) = '0' Then
                   Begin
                   Ind := NotasFiscaisEntradas02.SGD_Produtos.RowCount;

                   NotasFiscaisEntradas02.SGD_Produtos.Cells[0, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[1, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[2, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[3, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[4, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[5, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[6, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[7, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[8, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[9, (Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[10,(Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[11,(Ind - 1)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[12,(Ind - 1)]  := '';

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas02.SGD_Produtos.Refresh;
                   NotasFiscaisEntradas03.Close;
                   End
                Else
                   Begin
                   Ind := NotasFiscaisEntradas02.SGD_Produtos.RowCount;

                   NotasFiscaisEntradas02.SGD_Produtos.Cells[0, (Ind - 1)] := Adiciona_Codigo_Produto.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[1, (Ind - 1)] := Adiciona_Referencia.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[2, (Ind - 1)] := Adiciona_Descricao.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[3, (Ind - 1)] := Adiciona_CF.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[4, (Ind - 1)] := Adiciona_ST.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[5, (Ind - 1)] := Adiciona_Unidade.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[6, (Ind - 1)] := Adiciona_Quantidade.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[7, (Ind - 1)] := Adiciona_Quantidade_Unidade.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[8, (Ind - 1)] := Adiciona_Vlr_Unitario.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[9, (Ind - 1)] := Adiciona_Vlr_Total.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[10,(Ind - 1)] := Adiciona_ICMS.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[11,(Ind - 1)] := Adiciona_IPI.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[12,(Ind - 1)] := Adiciona_Vlr_IPI.Text;

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas02.SGD_Produtos.RowCount := Ind + 1;
                   NotasFiscaisEntradas02.SGD_Produtos.Row      := Ind - 1;
                   NotasFiscaisEntradas02.SGD_Produtos.Refresh;

                   Adiciona_Codigo_Produto.SetFocus;
                End;
                End
             Else If Trim(Programa_Anterior.Text) = 'Entrada-Alteracao-Alteracao' Then
                Begin
                If Trim(Adiciona_Quantidade.Text) = '0' Then
                   Begin
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := '';
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := '';

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas02.SGD_Produtos.Refresh;
                   NotasFiscaisEntradas03.Close;
                   End
                Else
                   Begin
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[0, StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[1, StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[2, StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[3, StrToInt(Adiciona_ARow.Text)] := Adiciona_CF.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[4, StrToInt(Adiciona_ARow.Text)] := Adiciona_ST.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[5, StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[6, StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[7, StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade_Unidade.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[8, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_Unitario.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[9, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_Total.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_ICMS.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
                   NotasFiscaisEntradas02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_IPI.Text;

                   Adiciona_Codigo_Produto.Text     := '';
                   Adiciona_Referencia.Text         := '';
                   Adiciona_Descricao.Text          := '';
                   Adiciona_CF.Text                 := '';
                   Adiciona_ST.Text                 := '';
                   Adiciona_Unidade.Text            := '';
                   Adiciona_Quantidade.Text         := '0';
                   Adiciona_Quantidade_Unidade.Text := '0';
                   Adiciona_Vlr_Unitario.Text       := '0,00';
                   Adiciona_Vlr_Total.Text          := '0,00';
                   Adiciona_ICMS.Text               := '0';
                   Adiciona_IPI.Text                := '0';
                   Adiciona_Vlr_IPI.Text            := '0,00';

                   NotasFiscaisEntradas02.SGD_Produtos.Refresh;
                   NotasFiscaisEntradas03.Close;
                End;
             End;
     End;
end;

procedure TNotasFiscaisEntradas03.FormShow(Sender: TObject);
begin
     Adiciona_Codigo_Produto.SetFocus;
end;

end.
