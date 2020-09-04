unit Fixo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFixo00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Fixo: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label41: TLabel;
    Fixo_Conta: TComboBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Fixo_Fornecedor_Numero: TEdit;
    Fixo_Fornecedor_Nome: TEdit;
    BT_Procurar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_FixoCellClick(Column: TColumn);
    procedure Fixo_ContaChange(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fixo00: TFixo00;

implementation

uses Conexao_BD, Rotinas_Gerais, Fixo_01, Fixo_02, Ibrasmak_00,
  Fornecedor_00;

{$R *.dfm}

procedure TFixo00.BT_SairClick(Sender: TObject);
begin
     Fixo00.Close;
end;

procedure TFixo00.BT_IncluirClick(Sender: TObject);
begin
     Fixo00.Visible := False;

     Application.CreateForm(TFixo01,Fixo01);

     Fixo01.Fixo_Conta.Caption := Trim(Fixo_Conta.Text);

     Fixo01.ShowModal;
     Fixo01.Destroy;

     Fixo00.Visible := True;
end;

procedure TFixo00.FormShow(Sender: TObject);

var
   Nro_Conta: String;

begin
    If Trim(Fixo_Conta.Text) = '' Then
       Begin
       ConexaoBD.SQL_FB_Conta_Bancaria.Close;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
       ConexaoBD.SQL_FB_Conta_Bancaria.Open;

       Fixo_Conta.Items.Clear;

       If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
          Begin
          ConexaoBD.SQL_FB_Conta_Bancaria.First;

          While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
                begin
                Fixo_Conta.Items.Add(Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_banco.Text) + ' - AG: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_agencia.Text) + ' - CC: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_conta.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_titular.Text));

                ConexaoBD.SQL_FB_Conta_Bancaria.Next;
          End;
       End;

       ConexaoBD.SQL_FB_Conta_Bancaria.Close;

       Fixo_Conta.ItemIndex := 0;
    End;

    Nro_Conta := Obtem_Nro_Antes_Traco(Fixo_Conta.Text);

    ConexaoBD.SQL_FB_Titulo_Fixo.Close;
    ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Clear;
    ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Add('Select * from fb_titulos_fixos Where fb_titulo_fixo_conta = ' + Trim(Nro_Conta) + ' Order By fb_titulo_fixo_dia');
    ConexaoBD.SQL_FB_Titulo_Fixo.Open;
end;

procedure TFixo00.DBGrid_FixoCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Fixo.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Fixo.Fields[0].Text;

      Fixo00.Visible := False;

      Ampulheta();
      Application.CreateForm(TFixo02,Fixo02);

      Fixo02.Fixo_Conta.Caption      := Trim(Fixo_Conta.Text);
      Fixo02.Fixo_Nro.Text           := DBGrid_Fixo.Fields[0].Text;
      Fixo02.Fixo_Dia.Text           := DBGrid_Fixo.Fields[1].Text;
      Fixo02.Fixo_Dia_ANT.Text       := DBGrid_Fixo.Fields[1].Text;
      Fixo02.Fixo_Descricao.Text     := DBGrid_Fixo.Fields[2].Text;
      Fixo02.Fixo_Descricao_ANT.Text := DBGrid_Fixo.Fields[2].Text;
      Fixo02.Fixo_Valor.Text         := DBGrid_Fixo.Fields[3].Text;

      If Trim(DBGrid_Fixo.Fields[4].Text) = 'I' Then
         Begin
         Fixo02.Opcao_Indeterminada.Checked := True;
         End
      Else
         Begin
         Fixo02.Opcao_Determinada.Checked := True;
      End;

      Fixo02.Data_Determinada.Text       := DBGrid_Fixo.Fields[5].Text;
      Fixo02.Fixo_Fornecedor_Numero.Text := DBGrid_Fixo.Fields[6].Text;
      Fixo02.Fixo_Fornecedor_Nome.Text   := DBGrid_Fixo.Fields[7].Text;

      Seta();

      Fixo02.ShowModal;
      Fixo02.Destroy;

      Fixo00.Visible := True;    

      ConexaoBD.SQL_FB_Titulo_Fixo.Locate('fb_titulo_fixo_nro',Trim(Selecionado),[]);
    End;
end;

procedure TFixo00.Fixo_ContaChange(Sender: TObject);

var
   Nro_Conta: String;

begin
     Nro_Conta := Obtem_Nro_Antes_Traco(Fixo_Conta.Text);

     ConexaoBD.SQL_FB_Titulo_Fixo.Close;
     ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Clear;
     ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Add('Select * from fb_titulos_fixos Where fb_titulo_fixo_conta = ' + Trim(Nro_Conta) + ' Order By fb_titulo_fixo_dia');
     ConexaoBD.SQL_FB_Titulo_Fixo.Open;

     Fixo_Fornecedor_Numero.Text := '0';
     Fixo_Fornecedor_Nome.Text   := '--- Todos ---';
end;

procedure TFixo00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Titulo_Fixo';
     Fornecedor00.Fornecedor_Area.ItemIndex := 0;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
end;

procedure TFixo00.BitBtn1Click(Sender: TObject);

var
   Nro_Conta: String;

begin
     Nro_Conta := Obtem_Nro_Antes_Traco(Fixo_Conta.Text);

     If Trim(Fixo_Fornecedor_Numero.Text) <> '0' Then
        Begin
        ConexaoBD.SQL_FB_Titulo_Fixo.Close;
        ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Clear;
        ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Add('Select * from fb_titulos_fixos Where fb_titulo_fixo_conta = ' + Trim(Nro_Conta) + ' And fb_titulo_fixo_fornecedor_numero = ' + Trim(Fixo_Fornecedor_Numero.Text) + ' Order By fb_titulo_fixo_dia');
        ConexaoBD.SQL_FB_Titulo_Fixo.Open;
        End
     Else
        Begin
        ConexaoBD.SQL_FB_Titulo_Fixo.Close;
        ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Clear;
        ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Add('Select * from fb_titulos_fixos Where fb_titulo_fixo_conta = ' + Trim(Nro_Conta) + ' Order By fb_titulo_fixo_dia');
        ConexaoBD.SQL_FB_Titulo_Fixo.Open;
     End;
end;

end.
