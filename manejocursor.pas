unit ManejoCursor;
{$CODEPAGE UTF8}

interface

uses
  crt;

procedure MoverCursor(Dir: String);
procedure Debug(x, y: Word);

implementation
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
      'Der': if x < 17 then Inc(x);
      'Aba': if y < 17 then Inc(y);
    end;
    GotoXY(x, y);
  end;
end.