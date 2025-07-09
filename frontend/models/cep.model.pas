unit cep.model;

interface

uses
  cep.model.dados, cep.model.entities, REST.Json;

type
  TCepModel = class
  private
    FDmDados: TdmDados;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterDadosCep(const aCep: String): TDadosCepDTO;
  end;

implementation

uses
  Vcl.Forms;

{ TCepModel }

constructor TCepModel.Create;
begin
  FDmDados := TdmDados.Create(nil);
end;

destructor TCepModel.Destroy;
begin
  FDmDados.Free;
  inherited;
end;

function TCepModel.ObterDadosCep(const aCep: String): TDadosCepDTO;
begin
  FDmDados.restRequest.Params[0].Value := aCep;
  FDmDados.restRequest.Execute;

  Result := TJson.JsonToObject<TDadosCepDTO>(FDmDados.restResponse.Content);

end;

end.
