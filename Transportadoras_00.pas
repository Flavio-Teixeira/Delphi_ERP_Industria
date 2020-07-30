unit Transportadoras_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TTransportadoras00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Transportadoras: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Programa_Anterior: TEdit;
    Resultado_Adiciona_Transportadora_Pedido: TEdit;
    Transportadora_Escolhida: TEdit;
    Transportadora_Observacao: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_TransportadorasCellClick(Column: TColumn);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Adiciona_Transportadora_Pedido():Integer;

  public
    { Public declarations }
  end;

var
  Transportadoras00: TTransportadoras00;

implementation

uses Conexao_BD, Rotinas_Gerais, Transportadoras_01, Transportadoras_02,
  Ibrasmak_00, MSG_Adiciona_Transportadora_Pedido, Pedidos_01, Pedidos_02;

var Selecionado: string;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TTransportadoras00.Adiciona_Transportadora_Pedido():Integer;
begin
     If Trim(Programa_Anterior.Text) <> '' Then
        Begin
        Application.CreateForm(TMSGAdicionaTransportadoraPedido,MSGAdicionaTransportadoraPedido);

        MSGAdicionaTransportadoraPedido.Transportadora_Selecionada.Caption := Trim(DBGrid_Transportadoras.Fields[0].Text) + ' - ' + Trim(DBGrid_Transportadoras.Fields[2].Text);
        MSGAdicionaTransportadoraPedido.Programa_Anterior.Text             := Programa_Anterior.Text;
        Transportadora_Escolhida.Text                                      := Trim(DBGrid_Transportadoras.Fields[0].Text);

        MSGAdicionaTransportadoraPedido.ShowModal;
        MSGAdicionaTransportadoraPedido.Destroy;

        Result := StrToInt(Resultado_Adiciona_Transportadora_Pedido.Text);
        End
     Else
        Begin
        Result := 1;
     End;
end;

//******************
//*** Procedures ***
//******************

procedure TTransportadoras00.BT_SairClick(Sender: TObject);
begin
     Transportadoras00.Close;
end;

procedure TTransportadoras00.FormShow(Sender: TObject);
begin
    If Trim(Dados_Procura.Text) <> '' Then
       Begin
       BT_ProcurarClick(Sender);
       End
    Else
       Begin
       ConexaoBD.SQL_Transportadoras.Close;
       ConexaoBD.SQL_Transportadoras.SQL.Clear;
       ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome, fb_transportadora_razao_social');
       ConexaoBD.SQL_Transportadoras.Open;
    End;

    If Trim(Programa_Anterior.Text) <> '' Then
       Begin
       BT_Incluir.Visible := False;
    End;
end;

procedure TTransportadoras00.BT_IncluirClick(Sender: TObject);
begin
     Transportadoras00.Visible := False;

     Application.CreateForm(TTransportadoras01,Transportadoras01);
     Transportadoras01.ShowModal;
     Transportadoras01.Destroy;

     Transportadoras00.Visible := True;
end;

procedure TTransportadoras00.DBGrid_TransportadorasCellClick(
  Column: TColumn);
begin
    If DBGrid_Transportadoras.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Transportadoras.Fields[0].Text;

      If Adiciona_Transportadora_Pedido() = 1 Then
         Begin
         Transportadoras00.Visible := False;

         Ampulheta();
         Application.CreateForm(TTransportadoras02,Transportadoras02);

         Transportadoras02.Transportadora_Numero.Text              := DBGrid_Transportadoras.Fields[0].Text;
         Transportadoras02.Transportadora_CNPJ.Text                := DBGrid_Transportadoras.Fields[1].Text;
         Transportadoras02.Transportadora_Nome.Text                := DBGrid_Transportadoras.Fields[2].Text;
         Transportadoras02.Transportadora_Razao_Social.Text        := DBGrid_Transportadoras.Fields[3].Text;
         Transportadoras02.Transportadora_Endereco.Text            := DBGrid_Transportadoras.Fields[4].Text;
         Transportadoras02.Transportadora_Complemento.Text         := DBGrid_Transportadoras.Fields[5].Text;
         Transportadoras02.Transportadora_Bairro.Text              := DBGrid_Transportadoras.Fields[6].Text;
         Transportadoras02.Transportadora_Cidade.Text              := DBGrid_Transportadoras.Fields[7].Text;
         Transportadoras02.Transportadora_Estado.ItemIndex         := Obtem_Nro_Estado(DBGrid_Transportadoras.Fields[8].Text);
         Transportadoras02.Transportadora_Cep.Text                 := DBGrid_Transportadoras.Fields[9].Text;
         Transportadoras02.Transportadora_DDD.Text                 := DBGrid_Transportadoras.Fields[11].Text;
         Transportadoras02.Transportadora_Comercial.Text           := DBGrid_Transportadoras.Fields[12].Text;
         Transportadoras02.Transportadora_Ramal.Text               := DBGrid_Transportadoras.Fields[13].Text;
         Transportadoras02.Transportadora_Contato.Text             := DBGrid_Transportadoras.Fields[14].Text;
         Transportadoras02.Transportadora_EMail.Text               := DBGrid_Transportadoras.Fields[15].Text;
         Transportadoras02.Transportadora_Inscricao_Estadual.Text  := DBGrid_Transportadoras.Fields[16].Text;
         Transportadoras02.Transportadora_Inscricao_Municipal.Text := DBGrid_Transportadoras.Fields[17].Text;
         Transportadoras02.Transportadora_Pais.ItemIndex           := Obtem_Nro_Pais(DBGrid_Transportadoras.Fields[10].Text);

         Transportadoras02.Transportadora_Observacao.Lines.Clear;
         Transportadoras02.Transportadora_Observacao.Lines.Add(Transportadora_Observacao.Text);

         Seta();

         Transportadoras02.ShowModal;
         Transportadoras02.Destroy;

         Transportadoras00.Visible := True;

         ConexaoBD.SQL_Transportadoras.Locate('fb_transportadora_numero',Trim(Selecionado),[]);
         End
      Else
         Begin
          Ampulheta();

          ConexaoBD.SQL_Transportadoras.Locate('fb_transportadora_numero',Trim(Selecionado),[]);

          If Trim(Programa_Anterior.Text) = 'Pedidos-Inclusão' Then
             Begin
             Pedidos01.Cliente_Transportadora.ItemIndex := Obtem_Nro_Transportadora(Trim(Transportadora_Escolhida.Text));
             End
          Else If Trim(Programa_Anterior.Text) = 'Pedidos-Alteração' Then
             Begin
             Pedidos02.Cliente_Transportadora.ItemIndex := Obtem_Nro_Transportadora(Trim(Transportadora_Escolhida.Text));
          End;

          Seta();

          Transportadoras00.Close;
      End;
    End;
end;

procedure TTransportadoras00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Nro.Transportadora' Then
           Begin
           ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = ' + Trim(Dados_Procura.Text) + ' Order By fb_transportadora_nome, fb_transportadora_razao_social');
           End        
        Else If Opcoes_Procura.Text = 'Nome' Then
           Begin
           ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_nome Like '  +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_transportadora_nome, fb_transportadora_razao_social');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Nro.Transportadora' Then
           Begin
           ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome, fb_transportadora_razao_social');
           End        
        Else If Opcoes_Procura.Text = 'Nome' Then
           Begin
           ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome, fb_transportadora_razao_social');
        End;

     End;

     ConexaoBD.SQL_Transportadoras.Open;

     Seta();
end;

procedure TTransportadoras00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Transportadoras00 := Nil;
end;

end.
