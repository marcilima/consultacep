unit cep.principal.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cep.controller,
  cep.model, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    btnBuscarCep: TButton;
    edtCep: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    edtLogradouro: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtBairro: TEdit;
    edtCidade: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtUF: TEdit;
    Label7: TLabel;
    edtEstado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarCepClick(Sender: TObject);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FModel: TCepModel;
    FController: TCepController;
  public
    { Public declarations }

    procedure AtualizarView;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AtualizarView;
begin
  var dadosCep := FController.obterDadosCep;
  if Assigned(dadosCep) then
  begin
    edtLogradouro.Text := dadosCep.Logradouro;
    edtBairro.Text := dadosCep.Bairro;
    edtCidade.Text := dadosCep.Cidade;
    edtUF.Text := dadosCep.Uf;
    edtEstado.Text := dadosCep.Estado;
  end else
  begin
    edtLogradouro.Clear;
    edtBairro.Clear;
    edtCidade.Clear;
    edtUF.Clear;
    edtEstado.Clear;  
    ShowMessage('Cep "'+edtCep.Text+'" não localizado, por favor verifique!')
  end;
end;

procedure TfrmPrincipal.btnBuscarCepClick(Sender: TObject);
begin
  FController.CarregarDadosCep(edtCep.Text);

  AtualizarView();
end;

procedure TfrmPrincipal.edtCepKeyPress(Sender: TObject; var Key: Char);
begin

  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FModel:= TCepModel.Create;
  FController := TCepController.Create(FModel);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FreeAndNil(FModel);
end;

end.
