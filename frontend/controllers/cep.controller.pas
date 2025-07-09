unit cep.controller;

interface

uses
  cep.model, cep.model.entities, cep.principal.view;

type

  TCepController = class
  private
    FView: TFrmPrincipal;
    FCepModel: TCepModel;
    FMensagemErro: String;
    FDadosCep: TDadosCepDTO;
    procedure btnBuscarCepClick(Sender: TObject);
    procedure LimparCampos;
  public
    constructor Create;
    procedure AtualizarView;
    class procedure ShowView;

    property View: TFrmPrincipal read FView;
    property MensagemErro: string read FMensagemErro;
  end;

implementation

uses
  DUnitX.TestFramework, Vcl.Dialogs, Vcl.Forms, System.SysUtils;

{ TCepController }

procedure TCepController.AtualizarView;
begin
  FMensagemErro := '';

  if Assigned(FDadosCep) then
  begin
    FView.edtLogradouro.Text := FDadosCep.Logradouro;
    FView.edtBairro.Text := FDadosCep.Bairro;
    FView.edtCidade.Text := FDadosCep.Cidade;
    FView.edtUF.Text := FDadosCep.Uf;
    FView.edtEstado.Text := FDadosCep.Estado;
    Exit;
  end;

  LimparCampos;

  FMensagemErro := 'Cep "'+FView.edtCep.Text+'" não localizado. Por favor verifique!';

  if TDUnitX.CurrentRunner.CurrentTestName='' then
    ShowMessage(FMensagemErro)

end;

procedure TCepController.btnBuscarCepClick(Sender: TObject);
begin

  try
    FDadosCep := FCepModel.ObterDadosCep(FView.edtCep.Text);
    AtualizarView;
  finally
    FreeAndNil(FDadosCep);
  end;

end;

constructor TCepController.Create;
begin
  Application.CreateForm(TfrmPrincipal, FView);
  FCepModel := TCepModel.Create;

  FView.btnBuscarCep.OnClick := btnBuscarCepClick;
end;

procedure TCepController.LimparCampos;
begin
  FView.edtLogradouro.Clear;
  FView.edtBairro.Clear;
  FView.edtCidade.Clear;
  FView.edtUF.Clear;
  FView.edtEstado.Clear;
end;

class procedure TCepController.ShowView;
var
  LCepController: TCepController;
begin
  LCepController := TCepController.Create;
  LCepController.FView.ShowModal;
end;

end.
