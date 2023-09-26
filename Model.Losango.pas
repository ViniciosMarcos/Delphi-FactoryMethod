unit Model.Losango;

interface

uses
  Model.Interfaces;

type
  TLosango = class(TInterfacedObject, ICalculoArea)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICalculoArea;
    function CalcularArea(ValorA, ValorB, ValorC: Extended):Extended;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TLosango }

function TLosango.CalcularArea(ValorA, ValorB, ValorC: Extended): Extended;
begin
  if(ValorA < 0) or (ValorB < 0)then
  begin
    MessageDlg('N�o existem medidas negativas. Verifique!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    Abort;
  end;
  Result := (ValorA * ValorB) / 2;
end;

constructor TLosango.Create;
begin

end;

destructor TLosango.Destroy;
begin
  inherited;
end;

class function TLosango.New: ICalculoArea;
begin
  Result := Self.Create;
end;

end.
