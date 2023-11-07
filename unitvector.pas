unit UnitVector;

interface

uses
  UnitType;

const
  N = 5;                                                            // CAMBIAR
type
  TDato = TDatoBarcos;                                              // CAMBIAR
  TVector = array[1..N] of TDato;

procedure InicializarVector(var v: TVector);
procedure CargarVector(var v: TVector);
procedure MostrarVector(v: TVector);

implementation
  procedure InicializarVector(var v: TVector);
  var
    i: Word;
  begin
    for i := 1 to N do v[i] := 0;
  end;

  procedure CargarVector(var v: TVector);
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
  end;
end.

