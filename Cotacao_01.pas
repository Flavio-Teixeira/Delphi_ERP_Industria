unit Cotacao_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TCotacao01 = class(TForm)
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Grupo_Descricao: TEdit;
    Label4: TLabel;
    Grupo_Data: TMaskEdit;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grupo_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Grupo_DataKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

  public
    { Public declarations }
  end;

var
  Cotacao01: TCotacao01;

implementation

uses Conexao_BD, Rotinas_Gerais, Cotacao_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TCotacao01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno, Valor_Inteiro: String;
   Resultado, Qtde_Nao_Preenchida: Boolean;
   Ind: Integer;

begin
     Resultado           := True;
     Campo_Retorno       := '';
     Qtde_Nao_Preenchida := True;

     Ampulheta();

     If Trim(Grupo_Descricao.Text) = '' Then
        Begin
        Erro          := 'Descrição Não Informada...';
        Campo_Retorno := 'Grupo_Descricao';
        End
     Else If Trim(Grupo_Data.Text) = '/  /' Then
        Begin
        Erro          := 'Data Não Informada...';
        Campo_Retorno := 'Grupo_Data';
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Grupo_Descricao' Then
           Begin
           Grupo_Descricao.SetFocus;
           End
        Else If Campo_Retorno = 'Grupo_Data' Then
           Begin
           Grupo_Data.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TCotacao01.BT_SairClick(Sender: TObject);
begin
     Cotacao01.Close;
end;

procedure TCotacao01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TCotacao01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_grupos_cotacoes(fb_grupo_cotacao_descricao, fb_grupo_cotacao_data) Values(' +#39+ Trim(Grupo_Descricao.Text) +#39+ ',' +#39+ Inverte_Data_Plus(Trim(Grupo_Data.Text),'amd','/') +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        ConexaoBD.SQL_Grupo_Cotacao.Close;
        ConexaoBD.SQL_Grupo_Cotacao.SQL.Clear;
        ConexaoBD.SQL_Grupo_Cotacao.SQL.Add('Select * from fb_grupos_cotacoes Order By fb_grupo_cotacao_nro Desc');
        ConexaoBD.SQL_Grupo_Cotacao.Open;

        If Not ConexaoBD.SQL_Grupo_Cotacao.Eof Then
           Begin

           Cotacao01.Visible := False;

           Application.CreateForm(TCotacao02,Cotacao02);

           Cotacao02.ShowModal;
           Cotacao02.Destroy;

           Cotacao01.Visible := True;

        End;

        Cotacao01.Close;
     End;
end;

procedure TCotacao01.FormShow(Sender: TObject);
begin
     Grupo_Data.Text := DateToStr(Date());
end;

procedure TCotacao01.Grupo_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao01.Grupo_DataKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
