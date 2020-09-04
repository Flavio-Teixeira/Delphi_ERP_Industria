unit Requisicao_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRequisicao01 = class(TForm)
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Grupo_Descricao: TEdit;
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
  Requisicao01: TRequisicao01;

implementation

uses Conexao_BD, Rotinas_Gerais, Requisicao_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TRequisicao01.Valida_Dados(): Boolean;

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

procedure TRequisicao01.BT_SairClick(Sender: TObject);
begin
     Requisicao01.Close;
end;

procedure TRequisicao01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRequisicao01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_grupos_requisicoes(fb_grupo_requisicao_descricao, fb_grupo_requisicao_data) Values(' +#39+ Trim(Grupo_Descricao.Text) +#39+ ',' +#39+ Inverte_Data_Plus(Trim(Grupo_Data.Text),'amd','/') +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        ConexaoBD.SQL_Grupo_Requisicao.Close;
        ConexaoBD.SQL_Grupo_Requisicao.SQL.Clear;
        ConexaoBD.SQL_Grupo_Requisicao.SQL.Add('Select * from fb_grupos_requisicoes Order By fb_grupo_requisicao_nro Desc');
        ConexaoBD.SQL_Grupo_Requisicao.Open;

        If Not ConexaoBD.SQL_Grupo_Requisicao.Eof Then
           Begin

           Requisicao01.Visible := False;

           Application.CreateForm(TRequisicao02,Requisicao02);

           Requisicao02.ShowModal;
           Requisicao02.Destroy;

           Requisicao01.Visible := True;

        End;

        Requisicao01.Close;
     End;
end;

procedure TRequisicao01.FormShow(Sender: TObject);
begin
     Grupo_Data.Text := DateToStr(Date());
end;

procedure TRequisicao01.Grupo_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao01.Grupo_DataKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
