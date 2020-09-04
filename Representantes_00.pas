unit Representantes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TRepresentantes00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Representantes: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    DBG_Representante_Observacao: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_RepresentantesCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Representantes00: TRepresentantes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Representantes_01, Representantes_02,
  Ibrasmak_00;    

var Selecionado: string;

{$R *.dfm}

procedure TRepresentantes00.BT_SairClick(Sender: TObject);
begin
     Representantes00.Close;
end;

procedure TRepresentantes00.BT_IncluirClick(Sender: TObject);
begin
     Representantes00.Visible := False;

     Application.CreateForm(TRepresentantes01,Representantes01);
     Representantes01.ShowModal;
     Representantes01.Destroy;

     Representantes00.Visible := True;
end;

procedure TRepresentantes00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Representantes.SQL.Clear;
    ConexaoBD.SQL_Representantes.SQL.Add('Select * from fb_representantes Order By fb_representante_codigo');
    ConexaoBD.SQL_Representantes.Open;
end;

procedure TRepresentantes00.DBGrid_RepresentantesCellClick(
  Column: TColumn);
begin
    If DBGrid_Representantes.Fields[0].Text <> '' Then Begin
        Selecionado := DBGrid_Representantes.Fields[0].Text;
        
        Representantes00.Visible := False;

        Ampulheta();
        Application.CreateForm(TRepresentantes02,Representantes02);

        Representantes02.Representante_Codigo.Text           := DBGrid_Representantes.Fields[0].Text;
        Representantes02.Representante_Nome.Text             := DBGrid_Representantes.Fields[1].Text;
        Representantes02.Representante_Contato.Text          := DBGrid_Representantes.Fields[2].Text;
        Representantes02.Representante_1_Porcentagem.Text    := DBGrid_Representantes.Fields[3].Text;
        Representantes02.Representante_2_Porcentagem.Text    := DBGrid_Representantes.Fields[4].Text;
        Representantes02.Representante_Endereco.Text         := DBGrid_Representantes.Fields[5].Text;
        Representantes02.Representante_Complemento.Text      := DBGrid_Representantes.Fields[6].Text;
        Representantes02.Representante_Bairro.Text           := DBGrid_Representantes.Fields[7].Text;
        Representantes02.Representante_Cidade.Text           := DBGrid_Representantes.Fields[8].Text;
        Representantes02.Representante_Estado.ItemIndex      := Obtem_Nro_Estado(DBGrid_Representantes.Fields[9].Text);
        Representantes02.Representante_Cep.Text              := DBGrid_Representantes.Fields[10].Text;
        Representantes02.Representante_Pais.ItemIndex        := Obtem_Nro_Pais(DBGrid_Representantes.Fields[11].Text);
        Representantes02.Representante_DDD.Text              := DBGrid_Representantes.Fields[12].Text;
        Representantes02.Representante_Ramal.Text            := DBGrid_Representantes.Fields[13].Text;
        Representantes02.Representante_Fone_Comercial.Text   := DBGrid_Representantes.Fields[14].Text;
        Representantes02.Representante_Fone_Residencial.Text := DBGrid_Representantes.Fields[15].Text;
        Representantes02.Representante_Fone_Celular.Text     := DBGrid_Representantes.Fields[16].Text;
        Representantes02.Representante_EMail.Text            := DBGrid_Representantes.Fields[17].Text;

        If DBGrid_Representantes.Fields[18].Text = 'S' Then
           Begin
           Representantes02.Representante_ICMS_Sim.Checked := True;
           Representantes02.Representante_ICMS_Nao.Checked := False;
           End
        Else
           Begin
           Representantes02.Representante_ICMS_Sim.Checked := False;
           Representantes02.Representante_ICMS_Nao.Checked := True;
        End;

        If DBGrid_Representantes.Fields[19].Text = 'S' Then
           Begin
           Representantes02.Representante_Relatorio_Sim.Checked := True;
           Representantes02.Representante_Relatorio_Nao.Checked := False;
           End
        Else
           Begin
           Representantes02.Representante_Relatorio_Sim.Checked := False;
           Representantes02.Representante_Relatorio_Nao.Checked := True;
        End;

        Representantes02.Representante_Observacao.Lines.Clear;
        Representantes02.Representante_Observacao.Lines.Add(DBG_Representante_Observacao.Text);

        Seta();

        Representantes02.ShowModal;
        Representantes02.Destroy;

        Representantes00.Visible := True; 

        ConexaoBD.SQL_Representantes.Locate('fb_representante_codigo',Trim(Selecionado),[]);
    End;
end;

procedure TRepresentantes00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Representantes00 := Nil;
end;

end.
