unit UnitMenu;

interface

procedure MostrarMenu;

implementation
procedure MostrarMenu;
  var
    Op: String[2];
  begin
    repeat
      WriteLn('[1] Iniciar Juego.');
      WriteLn('[2] Reglas.');
      WriteLn('[3] Salir.');
      WriteLn('Opción: ');
      ReadLn(Op);
      case Op of
        '1': IniciarJuego;
      end;
    until Op = '0';
  end;

end.