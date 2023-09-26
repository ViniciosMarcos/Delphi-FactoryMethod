unit Model.Trapezio;

interface

uses
  Model.Interfaces;

type

  TTrapezio = class(TInterfacedObject, ICalculoArea)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICalculoArea;
    function CalcularArea(ValorA, ValorB, ValorC: Extended):Extended;
  end;

implementation

{ TTrapezio }

function TTrapezio.CalcularArea(ValorA, ValorB, ValorC: Extended): Extended;
begin
  Result := ((ValorA + ValorB) * ValorC) / 2;
end;

constructor TTrapezio.Create;
begin

end;

destructor TTrapezio.Destroy;
begin

  inherited;
end;

class function TTrapezio.New: ICalculoArea;
begin
  Result := Self.Create;
end;


end.
