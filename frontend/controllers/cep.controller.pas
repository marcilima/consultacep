unit cep.controller;

interface

uses
  cep.model, cep.model.entities;

type

  TCepController = class
  private
    FCepModel: TCepModel;
  public
    constructor create(aCepModel :TCepModel);

    procedure CarregarDadosCep(const aCep:String);
    function obterDadosCep: TDadosCepDTO;
  end;

implementation

{ TCepController }

procedure TCepController.CarregarDadosCep(const aCep: String);
begin
  FCepModel.ObterDadosCep(aCep);
end;

constructor TCepController.create(aCepModel :TCepModel);
begin
  FCepModel := aCepModel;
end;

function TCepController.obterDadosCep: TDadosCepDTO;
begin
  Result := FCepModel.DadosCep;
end;

end.
