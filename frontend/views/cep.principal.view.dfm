object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consulta Cep'
  ClientHeight = 405
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 87
    Height = 15
    Caption = 'Informe seu CEP'
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 124
    Height = 25
    Caption = 'Dados do CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnBuscarCep: TButton
    Left = 160
    Top = 31
    Width = 89
    Height = 25
    Caption = 'Buscar Cep'
    TabOrder = 0
    OnClick = btnBuscarCepClick
  end
  object edtCep: TEdit
    Left = 8
    Top = 32
    Width = 146
    Height = 23
    TabOrder = 1
    OnKeyPress = edtCepKeyPress
  end
  object Panel1: TPanel
    Left = 8
    Top = 92
    Width = 967
    Height = 297
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 62
      Height = 15
      Caption = 'Logradouro'
    end
    object Label4: TLabel
      Left = 367
      Top = 16
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label5: TLabel
      Left = 494
      Top = 16
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object Label6: TLabel
      Left = 621
      Top = 16
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object Label7: TLabel
      Left = 748
      Top = 16
      Width = 35
      Height = 15
      Caption = 'Estado'
    end
    object edtLogradouro: TEdit
      Left = 8
      Top = 37
      Width = 353
      Height = 23
      TabOrder = 0
    end
    object edtBairro: TEdit
      Left = 367
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object edtCidade: TEdit
      Left = 494
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object edtUF: TEdit
      Left = 621
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object edtEstado: TEdit
      Left = 748
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 4
    end
  end
end
