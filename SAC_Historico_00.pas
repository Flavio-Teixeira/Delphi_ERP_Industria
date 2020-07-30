unit SAC_Historico_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TSACHistorico00 = class(TForm)
    Panel2: TPanel;
    DBGrid_SAC: TDBGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Sac: TLabel;
    Cliente_Pergunta: TMemo;
    Cliente_Resposta: TMemo;
    DB_Cliente_Resposta: TDBMemo;
    DB_Cliente_Pergunta: TDBMemo;
    BT_Incluir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_SACDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_SACCellClick(Column: TColumn);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Exibe_SAC();
    procedure Exibe_Tela_Informacao();    

  public
    { Public declarations }
  end;

var
  SACHistorico00: TSACHistorico00;

implementation

uses Conexao_BD, Rotinas_Gerais, Informacao_01;

{$R *.dfm}

procedure TSACHistorico00.BT_SairClick(Sender: TObject);
begin
     SACHistorico00.Close;
end;

procedure TSACHistorico00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TSACHistorico00.FormShow(Sender: TObject);
begin
     Exibe_SAC();
end;

procedure TSACHistorico00.Exibe_SAC();
begin
     ConexaoBD.SQL_Sac.SQL.Clear;
     ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_status, sac_data_alteracao Desc, sac_numero Desc');
     ConexaoBD.SQL_Sac.Open;

     Total_Sac.Caption := IntToStr(ConexaoBD.SQL_Sac.RecordCount);
end;

procedure TSACHistorico00.DBGrid_SACDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If Trim(DBGrid_SAC.Fields[6].Text) = 'Resolvida' Then
       Begin
       DBGrid_SAC.Canvas.Brush.Color := clMoneyGreen;
       End
    Else If Trim(DBGrid_SAC.Fields[6].Text) = 'Não Resolvida' Then
       Begin
        DBGrid_SAC.Canvas.Brush.Color := clRed;
    End;

    DBGrid_SAC.DefaultDrawDataCell(Rect, DBGrid_SAC.columns[datacol].field, State);
end;

procedure TSACHistorico00.DBGrid_SACCellClick(Column: TColumn);
begin
     If DBGrid_SAC.Fields[0].Text <> '' Then Begin
        Exibe_Tela_Informacao();
     End;
end;

procedure TSACHistorico00.Exibe_Tela_Informacao();

var
    Data_Informacao, Hora_Informacao, Linha_Informativa, SAC_Numero, SAC_Empresa, SAC_Cliente: String;
    Selecionado: string;
begin
    Ampulheta();

    Selecionado := DBGrid_SAC.Fields[0].Text;

    SAC_Numero  := DBGrid_SAC.Fields[0].Text;
    SAC_Empresa := DBGrid_SAC.Fields[7].Text;
    SAC_Cliente := DBGrid_SAC.Fields[2].Text;

    Application.CreateForm(TInformacao01,Informacao01);

    Data_Informacao   := DateToStr(Date());
    Hora_Informacao   := TimeToStr(Time());
    Linha_Informativa := '>>>>>>>>>> Data: ' + Trim(Data_Informacao) + ' - Hora: ' + Trim(Hora_Informacao) + ' <<<<<<<<<<';

    //*** Busca a Última Dúvida do Cliente ***

    conexaoBD.SQL_Sac.Close;
    conexaoBD.SQL_Sac.SQL.Clear;
    conexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_numero = ' + Trim(SAC_Numero) );
    conexaoBD.SQL_Sac.Open;

    If conexaoBD.SQL_Sac.Eof Then
      Begin
      Informacao01.Informacao_Cliente_Existe.Text := 'Não';
      Cliente_Pergunta.Lines.Clear;
      Cliente_Resposta.Lines.Clear;
      End
    Else
      Begin
      Informacao01.Informacao_Cliente_Existe.Text := 'Sim';
      Cliente_Pergunta.Lines.Clear;
      Cliente_Pergunta.Lines.Add(DB_Cliente_Pergunta.Lines.Text);

      Cliente_Resposta.Lines.Clear;
      Cliente_Resposta.Lines.Add(DB_Cliente_Resposta.Lines.Text);
    End;

    //*** Exibe Dados do Cliente ***

    conexaoBD.SQL_FB_Clientes.Close;
    conexaoBD.SQL_FB_Clientes.SQL.Clear;
    conexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = '+#39+ SAC_Cliente +#39);
    conexaoBD.SQL_FB_Clientes.Open;

    Informacao01.Cliente_Codigo.Text      := conexaoBD.SQL_FB_Clientesfb_cliente_codigo.Text;
    Informacao01.Cliente_Codigo_Tipo.Text := conexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text;
    Informacao01.Cliente_Empresa.Text := 'Ibrasmak';

    Informacao01.Cliente_Nome.Text             := conexaoBD.SQL_FB_Clientesfb_cliente_nome.Text;
    Informacao01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_FB_Clientesfb_cliente_estado.Text);
    Informacao01.Cliente_Cep.Text              := conexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
    Informacao01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_FB_Clientesfb_cliente_pais.Text);
    Informacao01.Cliente_Endereco.Text         := conexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text;
    Informacao01.Cliente_Complemento.Text      := conexaoBD.SQL_FB_Clientesfb_cliente_complemento.Text;
    Informacao01.Cliente_Bairro.Text           := conexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
    Informacao01.Cliente_Cidade.Text           := conexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
    Informacao01.Cliente_Contato.Text          := conexaoBD.SQL_FB_Clientesfb_cliente_contato.Text;
    Informacao01.Cliente_DDD.Text              := conexaoBD.SQL_FB_Clientesfb_cliente_ddd.Text;
    Informacao01.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_FB_Clientesfb_cliente_fone_ramal.Text;
    Informacao01.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Informacao01.Cliente_Fone_Residencial.Text := conexaoBD.SQL_FB_Clientesfb_cliente_fone_residencial.Text;
    Informacao01.Cliente_Fone_Celular.Text     := conexaoBD.SQL_FB_Clientesfb_cliente_fone_celular.Text;
    Informacao01.Cliente_Fone_Fax.Text         := conexaoBD.SQL_FB_Clientesfb_cliente_fone_fax.Text;
    Informacao01.Cliente_Email.Text            := conexaoBD.SQL_FB_Clientesfb_cliente_email.Text;

    Informacao01.Sac_Pergunta.Lines.Clear;
    Informacao01.Sac_Pergunta.Lines.Add(Linha_Informativa);
    Informacao01.Sac_Pergunta.Lines.Add('');
    Informacao01.Sac_Pergunta.Lines.Add('');
    Informacao01.Sac_Pergunta.Lines.Add('');
    Informacao01.Sac_Pergunta.Lines.Add(Cliente_Pergunta.Lines.Text);

    Informacao01.Sac_Resposta.Lines.Clear;
    Informacao01.Sac_Resposta.Lines.Add(Linha_Informativa);
    Informacao01.Sac_Resposta.Lines.Add('');
    Informacao01.Sac_Resposta.Lines.Add('');
    Informacao01.Sac_Resposta.Lines.Add('');
    Informacao01.Sac_Resposta.Lines.Add(Cliente_Resposta.Lines.Text);

    Seta();

    SACHistorico00.Visible := False;

    Informacao01.ShowModal;
    Informacao01.Destroy;

    SACHistorico00.Visible := True;  

    ConexaoBD.SQL_Sac.Locate('sac_numero',Trim(Selecionado),[]);
end;

procedure TSACHistorico00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Sac.Close;
     ConexaoBD.SQL_Sac.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_cliente_codigo Like ' +#39+ Trim(Dados_Procura.Text) +'%'+#39+' Order By sac_cliente_codigo');
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_nome_cliente Like ' +#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By sac_nome_cliente');
           End
        Else If Opcoes_Procura.Text = 'Nro. do SAC' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_numero = ' + Trim(Dados_Procura.Text) + ' Order By sac_numero');
           End
        Else If Opcoes_Procura.Text = 'Data da 1o. Contato' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where  sac_data_contato = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By sac_data_contato');
           End
        Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By sac_data_inclusao');
           End
        Else If Opcoes_Procura.Text = 'Data de Alteração' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By sac_data_alteracao');
           End
        Else If Opcoes_Procura.Text = 'Status' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Where sac_status = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By sac_status');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_cliente_codigo');
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_nome_cliente');
           End
        Else If Opcoes_Procura.Text = 'Nro. do SAC' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_numero');
           End
        Else If Opcoes_Procura.Text = 'Data da 1o. Contato' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_data_contato');
           End
        Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_data_inclusao');
           End
        Else If Opcoes_Procura.Text = 'Data de Alteração' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_data_alteracao');
           End
        Else If Opcoes_Procura.Text = 'Status' Then
           Begin
           ConexaoBD.SQL_Sac.SQL.Add('Select * from sac Order By sac_status');
        End;

     End;

     ConexaoBD.SQL_Sac.Open;

     Total_Sac.Caption := IntToStr(ConexaoBD.SQL_Sac.RecordCount);

     Seta();
end;

procedure TSACHistorico00.BT_IncluirClick(Sender: TObject);

var
   Data_Informacao, Hora_Informacao, Linha_Informativa, SAC_Numero, SAC_Empresa, SAC_Cliente: String;

begin
     Ampulheta();

     SAC_Numero  := '';
     SAC_Empresa := '';
     SAC_Cliente := '';

     Application.CreateForm(TInformacao01,Informacao01);

     Data_Informacao   := DateToStr(Date());
     Hora_Informacao   := TimeToStr(Time());
     Linha_Informativa := '>>>>>>>>>> Data: ' + Trim(Data_Informacao) + ' - Hora: ' + Trim(Hora_Informacao) + ' <<<<<<<<<<';

     //*** Busca a Última Dúvida do Cliente ***

     Informacao01.Informacao_Cliente_Existe.Text := 'Não';
     Cliente_Pergunta.Lines.Clear;
     Cliente_Resposta.Lines.Clear;

     //*** Exibe Dados do Cliente ***

     Informacao01.Cliente_Empresa.Text := 'Ibrasmak';

     Informacao01.Sac_Pergunta.Lines.Clear;
     Informacao01.Sac_Pergunta.Lines.Add(Linha_Informativa);
     Informacao01.Sac_Pergunta.Lines.Add('');
     Informacao01.Sac_Pergunta.Lines.Add('');
     Informacao01.Sac_Pergunta.Lines.Add('');

     Informacao01.Sac_Resposta.Lines.Clear;
     Informacao01.Sac_Resposta.Lines.Add(Linha_Informativa);
     Informacao01.Sac_Resposta.Lines.Add('');
     Informacao01.Sac_Resposta.Lines.Add('');
     Informacao01.Sac_Resposta.Lines.Add('');

     Seta();

     SACHistorico00.Visible := False;

     Informacao01.ShowModal;
     Informacao01.Destroy;

     SACHistorico00.Visible := True;
end;

end.
