unit ManejoCursor;
{$CODEPAGE UTF8}

interface

uses
  crt;

function ObtenerTecla: String;
procedure Accion;
procedure InterpretarTecla(Tecla: String);
procedure MoverCursor(Dir: String);
procedure Debug(x, y: Word);

implementation
function ObtenerTecla: String;
  var
    Tecla: Char;
  begin
    Tecla := ReadKey;
    if Ord(Tecla) = 0 then
    begin
      Tecla := ReadKey;
      if Tecla in [#72, #75, #77, #80] then
      case Tecla of
        #72: ObtenerTecla := 'Arr';
        #75: ObtenerTecla := 'Izq';
        #77: ObtenerTecla := 'Der';
        #80: ObtenerTecla := 'Aba';
      end;
    end
    else
      case LowerCase(Tecla) of
        'r': ObtenerTecla := 'Rot';
        'z': ObtenerTecla := 'Col';
      end;
  end;

procedure Accion;
  begin
    InterpretarTecla(ObtenerTecla);
  end;

procedure InterpretarTecla(Tecla: String);
  begin
    case Tecla of
      'Arr': MoverCursor(Tecla);
      'Izq': MoverCursor(Tecla);
      'Der': MoverCursor(Tecla);
      'Aba': MoverCursor(Tecla);
    end;
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

procedure MoverCursor(Dir: String);
  var
    x, y: Word;
  begin
    x := WhereX;
    y := WhereY;
    TextColor(White);
    Debug(x, y);
    case Dir of
      'Arr': if y > 8 then Dec(y);
      'Izq': if x > 8 then Dec(x);
      'Der': if x < 18 then Inc(x);
      'Aba': if y < 18 then Inc(y);
    end;
    GotoXY(x, y);
  end;
end.