unit LogicaJuego;

interface
uses
  UnitMatriz, UnitVector, ManejoCursor, ManejoPantalla, UnitType, crt;

procedure IniciarJuego;
procedure InicializarJuego(var MBarA: TMatrizBarcos; var MBarB: TMatrizBarcos; var MAtkA: TMatrizAtaques;
                           var MAtkB: TMatrizAtaques; var BarcosA: TVector; var BarcosB: TVector);
procedure Accion;

function ObtenerTecla: String;
procedure InterpretarTecla(Tecla: String);

implementation
procedure IniciarJuego;
  var
    MBarJugA, MBarJugB: TMatrizBarcos;
    MAtkJugA, MAtkJugB: TMatrizAtaques;
    BarcosA, BarcosB: TVector;
    i: Word;
    x, y: Word;
  begin
    InicializarJuego(MBarJugA, MBarJugB, MAtkJugA, MAtkJugB, BarcosA, BarcosB);
    x := EsqX;
    y := EsqY;

    for i := 1 to 20 do
    begin
      MostrarMatrizBarcos(MBarJugA);
      GotoXY(x, y);
      MostrarBarco(BarcosA[1]);
      Accion;
      x := WhereX;
      y := WhereY;
    end;
  end;


procedure InicializarJuego(var MBarA: TMatrizBarcos; var MBarB: TMatrizBarcos; var MAtkA: TMatrizAtaques;
                           var MAtkB: TMatrizAtaques; var BarcosA: TVector; var BarcosB: TVector);
  begin
    InicializarMatrizBarcos(MBarA);
    InicializarMatrizBarcos(MBarB);
    InicializarVectorBarcos(BarcosA);
    InicializarVectorBarcos(BarcosB);
  end;

procedure Accion;
  begin
    InterpretarTecla(ObtenerTecla);
  end;

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

procedure InterpretarTecla(Tecla: String);
  begin
    if Tecla in ['Arr', 'Izq', 'Der', 'Aba'] then
{      if MovValido(Tecla) then}
        case Tecla of
          'Arr': MoverCursor(Tecla);
          'Izq': MoverCursor(Tecla);
          'Der': MoverCursor(Tecla);
          'Aba': MoverCursor(Tecla);
        end;
  end;

end.