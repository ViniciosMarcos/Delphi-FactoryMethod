unit View.Calculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask, Model.Tringulo;

type
  TF_ViewCalculo = class(TForm)
    Image1: TImage;
    RgArea: TRadioGroup;
    EditA: TLabeledEdit;
    EditB: TLabeledEdit;
    EditC: TLabeledEdit;
    BtnCalcular: TButton;
    LblResultado: TLabel;
    procedure RgAreaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditAKeyPress(Sender: TObject; var Key: Char);
    procedure EditBKeyPress(Sender: TObject; var Key: Char);
    procedure EditCKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ApenasNumeros(Numero: Char): Boolean;
  end;

var
  F_ViewCalculo: TF_ViewCalculo;

implementation

uses
  Model.Factory, Model.Interfaces;

{$R *.dfm}

function TF_ViewCalculo.ApenasNumeros(Numero: Char): Boolean;
begin
  // Fun��o destinada a verifica��o de apenas entrada de n�meros no Edit.
  if not(Numero in ['0' .. '9', #8, #13, ',', ^C, ^V, ^X]) then
  begin
    MessageDlg('Digite apenas n�meros!', TMsgDlgType.mtInformation,
      [TMsgDlgBtn.mbOK], 0);
    Result := False;
  end
  else
    Result := True;
end;

procedure TF_ViewCalculo.BtnCalcularClick(Sender: TObject);
var
  Calculo: IFactory;
  Figura: ICalculoArea;
  Resultado: Extended;
  Figuras: TFiguraArea;
begin

  Calculo := TModelFactory.New;
  Figuras := TFiguraArea(RgArea.ItemIndex);
  Resultado := 0;

  case Figuras of
    Triangulo:
      begin
        Figura := Calculo.Area(TFiguraArea(Triangulo));
        Resultado := Figura.CalcularArea(StrToFloat(EditA.Text),
          StrToFloat(EditB.Text), 0);
      end;

    Quadrado:
      begin
        Figura := Calculo.Area(TFiguraArea(Quadrado));
        Resultado := Figura.CalcularArea(StrToFloat(EditA.Text), 0, 0);
      end;

    Losango:
      begin
        Figura := Calculo.Area(TFiguraArea(Losango));
        Resultado := Figura.CalcularArea(StrToFloat(EditA.Text),
          StrToFloat(EditB.Text), 0);
      end;

    Retangulo:
      begin
        Figura := Calculo.Area(TFiguraArea(Retangulo));
        Resultado := Figura.CalcularArea(StrToFloat(EditA.Text),
          StrToFloat(EditB.Text), 0);
      end;

    Trapezio:
      begin
        Figura := Calculo.Area(TFiguraArea(Trapezio));
        Resultado := Figura.CalcularArea(StrToFloat(EditA.Text),
          StrToFloat(EditB.Text), StrToFloat(EditC.Text));
      end;

    Circulo:
      begin
        Figura := Calculo.Area(TFiguraArea(Circulo));
        Resultado := Figura.CalcularArea(StrToFloat(EditA.Text),
          StrToFloat(EditB.Text), 0);
      end;
  end;

  LblResultado.Caption := 'A �rea da Figura �: ' + FloatToStr(Resultado);
end;

procedure TF_ViewCalculo.EditAKeyPress(Sender: TObject; var Key: Char);
begin
  if not ApenasNumeros(Key) then
  begin
    EditA.Clear;
    Key := #0;
  end;
end;

procedure TF_ViewCalculo.EditBKeyPress(Sender: TObject; var Key: Char);
begin
  if not ApenasNumeros(Key) then
  begin
    EditB.Clear;
    Key := #0;
  end;
end;

procedure TF_ViewCalculo.EditCKeyPress(Sender: TObject; var Key: Char);
begin
  if not ApenasNumeros(Key) then
  begin
    EditC.Clear;
    Key := #0;
  end;
end;

procedure TF_ViewCalculo.FormShow(Sender: TObject);
begin
  RgAreaClick(self);
end;

procedure TF_ViewCalculo.RgAreaClick(Sender: TObject);
begin
  case RgArea.ItemIndex of
    0:
      begin
        // Trin�ngulo
        EditA.EditLabel.Caption := 'Valor para b:';
        EditB.EditLabel.Caption := 'Valor para h:';
        EditC.Visible := False;
      end;
    1:
      begin
        // Quadrado
        EditA.Visible := True;
        EditA.EditLabel.Caption := 'Valor para L:';
        EditB.Visible := False;
        EditC.Visible := False;
      end;
    2:
      begin
        // Losango
        EditA.Visible := True;
        EditA.EditLabel.Caption := 'Valor para D:';
        EditB.Visible := True;
        EditB.EditLabel.Caption := 'Valor para d:';
        EditC.Visible := False;
      end;
    3:
      begin
        // Ret�ngulo
        EditA.Visible := True;
        EditA.EditLabel.Caption := 'Valor para b:';
        EditB.Visible := True;
        EditB.EditLabel.Caption := 'Valor para h:';
        EditC.Visible := False;
      end;
    4:
      begin
        // Trap�zio
        EditA.Visible := True;
        EditA.EditLabel.Caption := 'Valor para B:';
        EditB.Visible := True;
        EditB.EditLabel.Caption := 'Valor para b:';
        EditC.Visible := True;
        EditC.EditLabel.Caption := 'Valor para h:';
      end;
    5:
      begin
        // C�rculo
        EditA.Visible := True;
        EditA.EditLabel.Caption := 'Valor para r:';
        EditB.Visible := False;
        EditC.Visible := False;
      end;
  end;
end;

end.
