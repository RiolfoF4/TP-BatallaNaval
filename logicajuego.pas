unit LogicaJuego;

interface
uses
  UnitMatriz, UnitVector, ManejoCursor, ManejoPantalla, UnitType, UnitValidacion, crt;

procedure IniciarJuego;
procedure InicializarJuego(var MBarA: TMatrizBarcos; var MBarB: TMatrizBarcos; var MAtkA: TMatrizAtaques;
                           var MAtkB: TMatrizAtaques; var BarcosA: TVector; var BarcosB: TVector);
{------ PRIMER TURNO ------}
procedure PrimerTurno(var MBar: TMatrizBarcos; var Barcos: TVector; Turno: Byte);
procedure AccionPrimerTurno(var Barco: TDatoBarcos; var MBar: TMatrizBarcos; var Cod: Byte; Turno: Byte);
procedure InterpretarAccionPrimerT(Accion: String; var Barco: TDatoBarcos; var MBar: TMatrizBarcos; var Cod: Byte; Turno: Byte);
procedure RotarBarco(var Barco: TDatoBarcos);
procedure ColocarBarco(var Barco: TDatoBarcos; var MBar: TMatrizBarcos; Turno: Byte);

procedure AccionJuego(var MBar: TMatrizBarcos; var MAtk: TMatrizAtaques; var Barcos: TVector; Turno: Byte);
procedure InterpretarAccion(Accion: String; var MBar: TMatrizBarcos; var MAtk: TMatrizAtaques; var Barcos: TVector; Cod: Byte; Turno: Byte);
function ObtenerTecla: String;

implementation
procedure IniciarJuego;
  var
    MBarJugA, MBarJugB: TMatrizBarcos;
    MAtkJugA, MAtkJugB: TMatrizAtaques;
    BarcosA, BarcosB: TVector;
    Turno: Byte;
    x, y: Word;
    Accion: String[4];
  begin
    InicializarJuego(MBarJugA, MBarJugB, MAtkJugA, MAtkJugB, BarcosA, BarcosB);
    Turno := 1;
    PrimerTurno(MBarJugA, BarcosA, Turno);
    Turno := 2;
    PrimerTurno(MBarJugB, BarcosB, Turno);
    {while not JuegoTerminado do}
    if Turno = 1 then
      begin
        Turno := 2;
        AccionJuego(MBarJugA, MAtkJugB, BarcosA, Turno)
      end
    else
      Turno := 1;
      AccionJuego(MBarJugB, MAtkJugB, BarcosB, Turno);
  end;

procedure InicializarJuego(var MBarA: TMatrizBarcos; var MBarB: TMatrizBarcos; var MAtkA: TMatrizAtaques;
                           var MAtkB: TMatrizAtaques; var BarcosA: TVector; var BarcosB: TVector);
  begin
    InicializarMatrizBarcos(MBarA);
    InicializarMatrizBarcos(MBarB);
    InicializarMatrizAtaques(MAtkA);
    InicializarMatrizAtaques(MAtkB);
    InicializarVectorBarcos(BarcosA);
    InicializarVectorBarcos(BarcosB);
  end;

procedure PrimerTurno(var MBar: TMatrizBarcos; var Barcos: TVector; Turno: Byte);
  var
    i: Word;
    x, y: Word;
    Cod: Byte;
  begin
    for i := 1 to 5 do
    begin
      ObtenerCoord(Turno, x, y);
      Cod := 0;
      while Cod <> 3 do
      begin
        MostrarMatrizBarcos(MBar, Turno);
        GotoXY(x, y);
        MostrarBarco(Barcos[i]);
        AccionPrimerTurno(Barcos[i], MBar, Cod, Turno);
        x := WhereX;
        y := WhereY;
      end;
    end;
  end;

procedure AccionPrimerTurno(var Barco: TDatoBarcos; var MBar: TMatrizBarcos; var Cod: Byte; Turno: Byte);
  var
    Tecla: String[4];
  begin
    Tecla := ObtenerTecla;
    InterpretarAccionPrimerT(Tecla, Barco, MBar, Cod, Turno);
  end;

procedure RotarBarco(var Barco: TDatoBarcos);
  begin
    if Barco.Horient = 'H' then
      Barco.Horient := 'V'
    else
      Barco.Horient := 'H';
  end;

procedure ColocarBarco(var Barco: TDatoBarcos; var MBar: TMatrizBarcos; Turno: Byte);
  var
    x, y: Word;
    EsqX, EsqY: Word;
    i: Byte;
  begin
    ObtenerCoord(Turno, EsqX, EsqY);
    x := WhereX - EsqX + 1;
    y := WhereY - EsqY + 1;
    for i := 1 to Barco.Tam do
    begin
      MBar[y, x] := Barco.Nom[1];
      if Barco.Horient = 'V' then
        Inc(y)
      else
        Inc(x);
    end;
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
        #72: ObtenerTecla := 'MArr';
        #75: ObtenerTecla := 'MIzq';
        #77: ObtenerTecla := 'MDer';
        #80: ObtenerTecla := 'MAba';
      end;
    end
    else
      case LowerCase(Tecla) of
        'r': ObtenerTecla := 'Rot';
        'z': ObtenerTecla := 'Col';
      end;
  end;

procedure InterpretarAccionPrimerT(Accion: String; var Barco: TDatoBarcos; var MBar: TMatrizBarcos; var Cod: Byte; Turno: Byte);
  {Códigos: 
    1: Movimiento
    2: Rotar
    3: Colocar}
  begin
    if Accion[1] = 'M' then
    begin
      if MovValidoBar(Accion, Barco, Turno) then
      begin
        Cod := 1;
        MoverCursor(Accion);
      end;
    end
    else
      if Accion = 'Rot' then
      begin
        if RotValida(Barco, Turno) then
        begin
          RotarBarco(Barco);
          Cod := 2;
        end;
      end
      else
        if Accion = 'Col' then
          if ColValida(Barco, MBar, Turno) then
          begin
            ColocarBarco(Barco, MBar, Turno);
            Cod := 3;
          end;
  end;

procedure AccionJuego(var MBar: TMatrizBarcos; var MAtk: TMatrizAtaques; var Barcos: TVector; Turno: Byte);
  var
    Tecla: String[4];
    x, y: Word;
    EsqX, EsqY: Word;
    Cod: Byte;
  begin
    Cod := 0;
    ObtenerCoord(Turno, EsqX, EsqY);
    GotoXY(EsqX, EsqY);
    repeat
      Tecla := ObtenerTecla;
      InterpretarAccion(Tecla, MBar, MAtk, Barcos, Cod, Turno);
    until Cod = 2;
  end;

procedure InterpretarAccion(Accion: String; var MBar: TMatrizBarcos; var MAtk: TMatrizAtaques; var Barcos: TVector; Cod: Byte; Turno: Byte);
  begin
    if Accion[1] = 'M' then
    begin
      if MovValidoAtk(Accion, Turno) then
      begin
        Cod := 1;
        MoverCursor(Accion);
      end;
    end
    else
      if Accion = 'Col' then
        if AtaqueValido(MAtk, Turno) then
        begin
          
        end;
  end;
end.