unit ManejoPantalla;

interface

uses
  UnitMatriz, UnitType, crt;

procedure MostrarMatrizBarcos(M: TMatrizBarcos; Turno: Byte);
procedure MostrarMatrizAtaques(M: TMatrizAtaques; Turno: Byte);
procedure MostrarBarco(B: TDatoBarcos);
procedure ObtenerCoord(Turno: Byte; var x: Word; var y: Word);

implementation
procedure MostrarMatrizBarcos(M: TMatrizBarcos; Turno: Byte);
  var
    i, j: Word;
    x, y: Word;
    EsqX, EsqY: Word;
  begin
   ObtenerCoord(Turno, EsqX, EsqY);
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

procedure MostrarMatrizAtaques(M: TMatrizAtaques; Turno: Byte);
  var
    i, j: Word;
    x, y: Word;
    EsqX, EsqY: Word;
  begin
   ObtenerCoord(Turno, EsqX, EsqY);
   x := EsqX;
   y := EsqY - DespConst;
    for i := 1 to Filas do
    begin
      for j := 1 to Colnas do
      begin
        GotoXY(x, y);
        TextColor(Red);
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
    for i := 0 to B.Tam - 1 do
      if B.Horient = 'H' then
      begin
        GotoXY(x + i, y);
        Write(B.Nom[1]);
      end
      else
      begin
        GotoXY(x, y + i);
        Write(B.Nom[1]);
      end;      
    GotoXY(x, y);
  end;

procedure ObtenerCoord(Turno: Byte; var x: Word; var y: Word);
  begin
    if Turno = 1 then
    begin
      x := EsqXA;
      y := EsqYA;
    end
    else
    begin
      x := EsqXB;
      y := EsqYB;      
    end;
  end;

end.