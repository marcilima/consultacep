unit teste.cep.principal.view;

interface

uses
  DUnitX.TestFramework,
  cep.controller;

type
  [TestFrontend]
  TTestePrincipalView = class
  private
    FCepController: TCepController;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [TestCase('Testando cep 57252000','57252000,Avenida Prefeito José Virgínio da Silva')]
    [TestCase('Testando cep 05424020','05424020,Rua Professor Carlos Reis')]
    [TestCase('Testando cep 06233-030','06233-030,Rua Paula Rodrigues')]
    procedure ConsultarCep(const AValue : String; const logradouro: String);

    [TestCase('Testando cep Inválido','99999888,Cep "99999888" não localizado. Por favor verifique!')]
    procedure ConsultarCepInvalido(const AValue, aMensagemErro: String);
  end;

implementation

uses
  System.SysUtils;

procedure TTestePrincipalView.ConsultarCepInvalido(const AValue, aMensagemErro: String);
var
  ReturnValue: Boolean;
begin
  FCepController.View.edtCep.Text := AValue;
  FCepController.View.btnBuscarCep.Click;
  ReturnValue := (FCepController.MensagemErro = aMensagemErro);

  Assert.IsTrue(ReturnValue,aMensagemErro);
end;

procedure TTestePrincipalView.Setup;
begin
  FCepController:= TCepController.Create();
end;

procedure TTestePrincipalView.TearDown;
begin
  FCepController.Free;
end;

procedure TTestePrincipalView.ConsultarCep(const AValue : String; const logradouro: String);
var
  ReturnValue: Boolean;
begin
  FCepController.View.edtCep.Text := AValue;
  FCepController.View.btnBuscarCep.Click;
  TDUnitX.CurrentRunner.Status('Consultado cep'+ AValue);
  ReturnValue := (FCepController.View.edtLogradouro.Text = logradouro);

  Assert.IsTrue(ReturnValue,'Retornou Logradouro correto');

end;

initialization
  TDUnitX.RegisterTestFixture(TTestePrincipalView);

end.
