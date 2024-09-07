program frontend;

uses
  Vcl.Forms,
  cep.principal.view in 'views\cep.principal.view.pas' {frmPrincipal},
  cep.model.dados in 'models\cep.model.dados.pas' {dmDados: TDataModule},
  cep.controller in 'controllers\cep.controller.pas',
  cep.model.entities in 'models\cep.model.entities.pas',
  cep.model in 'models\cep.model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
