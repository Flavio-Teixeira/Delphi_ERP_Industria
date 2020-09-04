unit Rel_Cliente_Representante_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TRelClienteRepresentante00 = class(TForm)
    Panel1: TPanel;
    Label41: TLabel;
    Ficha_Representante: TComboBox;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelClienteRepresentante00: TRelClienteRepresentante00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Cliente_Representante_01, Ibrasmak_00;

{$R *.dfm}

procedure TRelClienteRepresentante00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelClienteRepresentante00.FormShow(Sender: TObject);
begin
    Ampulheta();

    If Trim(Ibrasmak00.Tipo_Acesso.Text) = 'L' Then BT_Imprimir.Enabled := False;

    // Obtem os Representantes
    ConexaoBD.SQL_Representantes.Close;
    ConexaoBD.SQL_Representantes.SQL.Clear;
    ConexaoBD.SQL_Representantes.SQL.Add('Select * from fb_representantes Order By fb_representante_nome');
    ConexaoBD.SQL_Representantes.Open;

    Ficha_Representante.Items.Clear;
    Ficha_Representante.Items.Add('--- Todos os Representantes ---');

    If ConexaoBD.SQL_Representantes.RecordCount > 0 Then
      begin
      ConexaoBD.SQL_Representantes.First;

      While Not ConexaoBD.SQL_Representantes.Eof Do
        begin
        Ficha_Representante.Items.Add(IntToStr(ConexaoBD.SQL_Representantesfb_representante_codigo.AsInteger)+' - '+ConexaoBD.SQL_Representantesfb_representante_nome.AsString);
        ConexaoBD.SQL_Representantes.Next;
      End;
    end;

    ConexaoBD.SQL_Representantes.Close;
    Ficha_Representante.ItemIndex := 0;

    Seta();
end;

procedure TRelClienteRepresentante00.BT_SairClick(Sender: TObject);
begin
     RelClienteRepresentante00.Close;
end;

procedure TRelClienteRepresentante00.BT_ImprimirClick(Sender: TObject);

var
   Nro_Representante, Comando_SQL: String;

begin
     Ampulheta();

     If Trim(Ficha_Representante.Text) = '--- Todos os Representantes ---' Then
        Begin
        Comando_SQL := 'select fb_cliente_nome,';
        Comando_SQL := Comando_SQL + 'fb_cliente_codigo,';
        Comando_SQL := Comando_SQL + 'fb_cliente_inscricao_estadual,';
        Comando_SQL := Comando_SQL + 'fb_cliente_status_credito,';
        Comando_SQL := Comando_SQL + 'fb_cliente_endereco,';
        Comando_SQL := Comando_SQL + 'fb_cliente_complemento,';
        Comando_SQL := Comando_SQL + 'fb_cliente_bairro,';
        Comando_SQL := Comando_SQL + 'fb_cliente_cidade,';
        Comando_SQL := Comando_SQL + 'fb_cliente_estado,';
        Comando_SQL := Comando_SQL + 'fb_cliente_cep,';
        Comando_SQL := Comando_SQL + 'fb_cliente_ddd,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_ramal,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_comercial,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_residencial,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_celular,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_fax,';
        Comando_SQL := Comando_SQL + 'fb_cliente_contato,';
        Comando_SQL := Comando_SQL + 'fb_cliente_data_ultima_compra,';
        Comando_SQL := Comando_SQL + 'fb_cliente_ultimo_valor,';
        Comando_SQL := Comando_SQL + 'fb_cliente_vendedor,';
        Comando_SQL := Comando_SQL + 'fb_representante_nome';
        Comando_SQL := Comando_SQL + ' from fb_clientes, fb_representantes where fb_cliente_vendedor = fb_representante_codigo order by fb_cliente_vendedor, fb_cliente_cep';

        ConexaoBD.SQL_Rel_Ficha_Visita.Close;
        ConexaoBD.SQL_Rel_Ficha_Visita.SQL.Clear;
        ConexaoBD.SQL_Rel_Ficha_Visita.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Ficha_Visita.Open;
        End
     Else
        Begin
        Nro_Representante := Obtem_Nro_Antes_Traco(Ficha_Representante.Text);

        Comando_SQL := 'select fb_cliente_nome,';
        Comando_SQL := Comando_SQL + 'fb_cliente_codigo,';
        Comando_SQL := Comando_SQL + 'fb_cliente_inscricao_estadual,';
        Comando_SQL := Comando_SQL + 'fb_cliente_status_credito,';
        Comando_SQL := Comando_SQL + 'fb_cliente_endereco,';
        Comando_SQL := Comando_SQL + 'fb_cliente_complemento,';
        Comando_SQL := Comando_SQL + 'fb_cliente_bairro,';
        Comando_SQL := Comando_SQL + 'fb_cliente_cidade,';
        Comando_SQL := Comando_SQL + 'fb_cliente_estado,';
        Comando_SQL := Comando_SQL + 'fb_cliente_cep,';
        Comando_SQL := Comando_SQL + 'fb_cliente_ddd,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_ramal,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_comercial,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_residencial,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_celular,';
        Comando_SQL := Comando_SQL + 'fb_cliente_fone_fax,';
        Comando_SQL := Comando_SQL + 'fb_cliente_contato,';
        Comando_SQL := Comando_SQL + 'fb_cliente_data_ultima_compra,';
        Comando_SQL := Comando_SQL + 'fb_cliente_ultimo_valor,';
        Comando_SQL := Comando_SQL + 'fb_cliente_vendedor,';
        Comando_SQL := Comando_SQL + 'fb_representante_nome';
        Comando_SQL := Comando_SQL + ' from fb_clientes, fb_representantes where ((fb_cliente_vendedor = '+Trim(Nro_Representante)+') and (fb_cliente_vendedor = fb_representante_codigo)) order by fb_cliente_vendedor, fb_cliente_cep';

        ConexaoBD.SQL_Rel_Ficha_Visita.Close;
        ConexaoBD.SQL_Rel_Ficha_Visita.SQL.Clear;
        ConexaoBD.SQL_Rel_Ficha_Visita.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Ficha_Visita.Open;
     End;

     Application.CreateForm(TRelClienteRepresentante01,RelClienteRepresentante01);

     Seta();

     RelClienteRepresentante01.RelFichasVisitas.Preview;
     RelClienteRepresentante01.RelFichasVisitas.Destroy;
     RelClienteRepresentante01.Destroy;
end;

end.
