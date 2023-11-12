unit UnitValidacion;

interface

uses
  crt, UnitType, UnitMatriz, ManejoPantalla;

function MovValidoBar(Accion: String; Barco: TDatoBarcos; Turno: Byte): Boolean;
function RotValida(Barco: TDatoBarcos; Turno: Byte): Boolean;
function ColValida(Barco: TDatoBarcos; MBar: TMatrizBarcos; Turno: Byte): Boolean;

function MovValidoAtk(Accion: String; Turno: Byte): Boolean;
function AtaqueValido(MAtk: TMatrizAtaques; Turno: Byte): Boolean;

implementation
function MovValidoBar(Accion: String; Barco: TDatoBarcos; Turno: Byte): Boolean;
  var
    x, y: Word;
    EsqX, EsqY: Word;
  begin
    MovValidoBar := False;
    x := WhereX;
    y := WhereY;
    ObtenerCoord(Turno, EsqX, EsqY);
    GotoXY(1,1);
    Write(y + Barco.Tam, ' ', Barco.Horient);
    GotoXY(x, y);
    Case Accion of
      'MArr': if y > EsqY then MovValidoBar := True;
      'MIzq': if x > EsqX then MovValidoBar := True;
      'MDer':
        begin
          if Barco.Horient = 'V' then
          begin
            if x < (EsqX + 9) then MovValidoBar := True
          end
          else
            if (x + Barco.Tam) < (EsqX + 10) then MovValidoBar := True;
        end;
      'MAba':
        begin
          if Barco.Horient = 'V' then
          begin
            if (y + Barco.Tam) < (EsqY + 10) then MovValidoBar := True
          end
          else
            if y < (EsqY + 9) then MovValidoBar := True;
        end;
    end;
  end;

function RotValida(Barco: TDatoBarcos; Turno: Byte): Boolean;
  var
    x, y: Word;
    EsqX, EsqY: Word;
  begin
    RotValida := False;
    x := WhereX;
    y := WhereY;
    ObtenerCoord(Turno, EsqX, EsqY);
    if Barco.Horient = 'V' then               // Si se quiere rotar de Vertical a Horizontal
    begin
      if (x + Barco.Tam - 1) < (EsqX + 10) then
        RotValida := True;
    end
    else                                      // Si se quiere rotar de Horizontal a Vertical
    begin
      if (y + Barco.Tam - 1) < (EsqY + 10) then
        RotValida := True;
    end;
  end;

function ColValida(Barco: TDatoBarcos; MBar: TMatrizBarcos; Turno: Byte): Boolean;
    var
      x, y: Word;
      EsqX, EsqY: Word;
      i: Byte;
    begin
    ColValida := True;
    ObtenerCoord(Turno, EsqX, EsqY);
    x := WhereX - EsqX + 1;
    y := WhereY - EsqY + 1;
    for i := 1 to Barco.Tam do
    begin
      if MBar[y, x] <> Agua then
        ColValida := False;
      if Barco.Horient = 'V' then
        Inc(y)
      else
        Inc(x);
    end;
  end;


function MovValidoAtk(Accion: String; Turno: Byte): Boolean;
  var
    x, y: Word;
    EsqX, EsqY: Word;
  begin
    MovValidoAtk := False;
    x := WhereX;
    y := WhereY;
    ObtenerCoord(Turno, EsqX, EsqY);
    EsqY := EsqY - DespConst;
    GotoXY(x, y);
    Case Accion of
      'MArr': if y > EsqY then MovValidoAtk := True;
      'MIzq': if x > EsqX then MovValidoAtk := True;
      'MDer': if x < (EsqX + 9) then MovValidoAtk := True;
      'MAba': if y < (EsqY + 9) then MovValidoAtk := True;
        end;
    end;

function AtaqueValido(MAtk: TMatrizAtaques; Turno: Byte): Boolean;
  var
    x, y: Word;
    EsqX, EsqY: Word;
  begin
    ObtenerCoord(Turno, EsqX, EsqY);
    EsqY := EsqY - DespConst;
    x := WhereX - EsqX + 1;
    y := WhereY - EsqY + 1;
    if MAtk[y, x] <> Agua then
      AtaqueValido := False
    else
      AtaqueValido := True;
  end;
end.