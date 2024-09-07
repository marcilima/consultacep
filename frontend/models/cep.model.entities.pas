unit cep.model.entities;

interface
type

  TDadosCepDTO = class
  private
    FCep: String;
    FLogradouro: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FUf: String;
    FIbge: String;
    FEstado: String;
  public
    property Cep: String read FCep write FCep;
    property Logradouro: String read FLogradouro write FLogradouro;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property Uf: String read FUf write FUf;
    property Ibge: String read FIbge write FIbge;
    property Estado: String read FEstado write FEstado;
  end;

implementation

end.
