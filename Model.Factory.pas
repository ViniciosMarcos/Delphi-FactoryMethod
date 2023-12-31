unit Model.Factory;

interface

uses
  Model.Interfaces, Model.Quadrado, Model.Tringulo, Model.Losango,
  Model.Retangulo, Model.Trapezio, Model.Circulo;

Type
  TModelFactory = class(TInterfacedObject, IFactory)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IFactory;
    function Area(Figura: TFiguraArea): ICalculoArea;
  end;

implementation

{ TModelFactory }

function TModelFactory.Area(Figura: TFiguraArea): ICalculoArea;
begin
  //Determina de qual figura ir� calcular a �rea.
  case Figura of
    Triangulo: Result := TTriangulo.New;
    Quadrado:  Result := TQuadrado.New;
    Losango:   Result := TLosango.New;
    Retangulo: Result := TRetangulo.New;
    Trapezio:  Result := TTrapezio.New;
    Circulo:   Result := TCirculo.New;
  end;
end;

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin
  inherited;
end;

class function TModelFactory.New: IFactory;
begin
  Result := Self.Create;
end;

end.
