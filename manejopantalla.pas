unit ManejoPantalla;

interface

uses
  UnitMatriz, UnitType, crt;

procedure MostrarMatrizBarcos(M: TMatrizBarcos);
procedure MostrarBarco(B: TDatoBarcos);

implementation
procedure MostrarMatrizBarcos(M: TMatrizBarcos);
  var
    i, j: Word;
    x, y: Word;
  begin
    x := EsqX;
    y := EsqY;
    for i := 1 to Filas do
    begin
      for j := 1 to Colnas do
      begin
        GotoXY(x, y);
        TextColor(White);
        if M[i,j] = Agua then
          TextColor(Cyan);
        Write(M[i, j]);
        Inc(x);
      end;
      Inc(y);
      x := EsqX;
    end;
    TextColor(White);
  end;

procedure MostrarBarco(B: TDatoBarcos);
  var
    i: Byte;
    x, y: Word;
  begin
    x := WhereX;
    y := WhereY;
    TextColor(White);
    for i := 0 to B.Tam do
      if B.Horient = 'H' then
      begin
        GotoXY(x, y + i);
        Write(B.Nom[1]);
      end
      else
      begin
        GotoXY(x + i, y);
        Write(B.Nom[1]);
      end;      
    GotoXY(x, y);
  end;
end.