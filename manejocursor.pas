unit ManejoCursor;
{$CODEPAGE UTF8}

interface

uses
  crt;

function ObtenerTecla(Tecla: Char): String;
procedure MoverCursor;
procedure Debug(x, y: Word);

implementation
function ObtenerTecla(Tecla: Char): String;
  begin
    if Ord(Tecla) = 0 then
    begin
      Tecla := ReadKey;
      case Tecla of
        #72: ObtenerTecla := 'Arr';
        #75: ObtenerTecla := 'Izq';
        #77: ObtenerTecla := 'Der';
        #80: ObtenerTecla := 'Aba';
      end;
    end
    else
      if Tecla = 'r' then
        ObtenerTecla := 'Rot';
  end;

procedure Debug(x, y: Word);
  begin
    GotoXY(70, 10);
    ClrEol;
    Write('Posición x: ', x);
    GotoXY(70, 12);
    ClrEol;
    Write('Posición y: ', y);
  end;

procedure MoverCursor;
  var
    Tecla: Char;
    Mov: String[10];
    x, y: Word;
  begin
    x := WhereX;
    y := WhereY;
    TextColor(White);
    Debug(x, y);
    Tecla := ReadKey;
    Mov := ObtenerTecla(Tecla);
    case Mov of
      'Arr': if y > 8 then Dec(y);
      'Izq': if x > 8 then Dec(x);
      'Der': if x < 18 then Inc(x);
      'Aba': if y < 18 then Inc(y);
    end;
    GotoXY(x, y);
  end;
end.