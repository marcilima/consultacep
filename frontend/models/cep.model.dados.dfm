object dmDados: TdmDados
  Height = 432
  Width = 441
  object restClient: TRESTClient
    BaseURL = 'http://127.0.0.1:9000'
    Params = <>
    SynchronizedEvents = False
    Left = 56
    Top = 88
  end
  object restRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = restClient
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'cep'
        Options = [poAutoCreated]
        ContentTypeStr = 'ctNone'
      end>
    Resource = 'cep/{cep}'
    Response = restResponse
    SynchronizedEvents = False
    Left = 152
    Top = 88
  end
  object restResponse: TRESTResponse
    Left = 264
    Top = 88
  end
end
