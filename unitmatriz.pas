unit UnitMatriz;

interface
uses
  UnitType;
const
  Filas = 10;                                                   // CAMBIAR
  Colnas = 10;                                                  // CAMBIAR
type
  TDato = Char;                                                 // CAMBIAR
  TMatrizBarcos = array[1..Filas, 1..Colnas] of TDato;
  TMatrizAtaques = array[1..Filas, 1..Colnas] of TDato;

procedure InicializarMatrizBarcos(var M: TMatrizBarcos);
procedure InicializarMatrizAtaques(var M: TMatrizAtaques);
{procedure CargarMatriz(var M: TMatriz; Fil, Col: Word);
procedure MostrarMatriz(M: TMatriz; Fil, Col: Word);}

implementation

procedure InicializarMatrizBarcos(var M: TMatrizBarcos);
  var
    i, j: Word;
  begin
    for i := 1 to Filas do
      for j := 1 to Colnas do
      begin
        M[i,j] := Agua;
      end;
  end;

procedure InicializarMatrizAtaques(var M: TMatrizAtaques);
  var
    i, j: Word;
  begin
    for i := 1 to Filas do
      for j := 1 to Colnas do
      begin
        M[i,j] := Agua;
      end;
  end;

{procedure CargarMatriz(var M: TMatriz; Fil, Col: Word);
  var
    i, j: Word;
  begin
    for i := 1 to Fil do
      for j := 1 to Col do
        begin
          Write('Elemento ', i, ', ', j, ': ');
          ReadLn(M[i, j]);
        end;
  end;}

{procedure MostrarMatriz(M: TMatriz; Fil, Col: Word);
  var
    i, j: Word;
  begin
    for i := 1 to Fil do
      for j := 1 to Col do
          WriteLn('Elemento ', i, ', ', j, ': ', M[i, j]);
  end;}
end.

