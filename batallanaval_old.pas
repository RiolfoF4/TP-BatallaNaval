program BatallaNaval_old;

uses
  ManejoCursor, video, crt, mouse;

const
  N = 10;
  EsquinaX = 8;
  EsquinaY = 8;
  Agua = '~';
type
  TGrilla = array[1..N, 1..N] of Char;
  TDestructor = record
    Tam: Byte;
    Hits: Byte;
    Activo: Boolean;
    Horient: Char;
  end;

var
  BDestructor: TDestructor;
  Grilla: TGrilla;
  Elim: Byte;
  PosX: Byte;
  PosY: Byte;
  Tecla: Char;

procedure InicializarGrilla(var Grilla: TGrilla);
  var
    i, j: 1..N;
  begin
    for i := 1 to N do
      for j := 1 to N do
        Grilla[i, j] := Agua;
  end;  

procedure MostrarGrilla(Grilla: TGrilla);
  var
    i, j: 1..N;
    x, y: Word;
  begin
    x := EsquinaX;
    y := EsquinaY;
    for i := 1 to N do
    begin
      for j := 1 to N do
      begin
        GotoXY(x, y);
        if Grilla[i, j] = Agua then
          TextColor(Cyan);
        Write(Grilla[i, j]);
        Inc(x);
      end;
      Inc(y);
      x := EsquinaX;
    end;
    TextColor(White);
  end;

procedure MostrarBarco(Barco: TDestructor);
  var
    i: Byte;
    x, y: Word;
  begin
    x := WhereX;
    y := WhereY;
    for i := 0 to Barco.Tam do
      if Barco.Horient = 'H' then
      begin
        GotoXY(x, y + i);
        Write('D');
      end
      else
      begin
        GotoXY(x + i, y);
        Write('D');
      end;      
    GotoXY(x, y);
  end;

begin
  with BDestructor do
  begin
    Tam := 2;
    Hits := 0;
    Activo := True;
    Horient := 'H';
  end;
  PosX := EsquinaX;
  PosY := EsquinaY;
  GotoXY(PosX, PosY);
  InicializarGrilla(Grilla);
  MostrarGrilla(Grilla);
  for Elim := 1 to 10 do
  begin
    GotoXY(PosX, PosY);
    MostrarBarco(BDestructor);
    Accion;
    PosX := WhereX;
    PosY := WhereY;
    MostrarGrilla(Grilla);
  end;
  ReadLn;
end.