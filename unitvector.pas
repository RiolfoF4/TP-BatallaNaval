unit UnitVector;

interface

uses
  UnitType;

const
  N = 5;                                                            // CAMBIAR
type
  TDato = TDatoBarcos;                                              // CAMBIAR
  TVector = array[1..N] of TDato;

procedure InicializarVectorBarcos(var v: TVector);
{procedure CargarVector(var v: TVector);
procedure MostrarVector(v: TVector);}

implementation
  procedure InicializarVectorBarcos(var v: TVector);
  var
    i: Word;
  begin
    for i := 1 to N do
    begin
      v[i].Nom := NombresBarcos[i];
      v[i].Tam := TamBarcos[i];
      v[i].Hits := 0;
      v[i].Destruido := False;
      v[i].Horient := 'V';
    end;
  end;

{  procedure CargarVector(var v: TVector);
  var
    i: Word;
  begin
    for i := 1 to N do
    begin
      Write('Ingrese el elemento ', i, ': ');
      ReadLn(v[i]);
    end;
  end;

  procedure MostrarVector(v: TVector);
  var
    i: Word;
  begin
    for i := 1 to N do WriteLn('Elemento ', i, ': ', v[i]);
  end;}
end.

