unit UnitType;

interface

const
  NombresBarcos: array [1..5] of String[11] = 
    ('Portaviones', 'Acorazado', 'Crucero', 'Submarino', 'Destruct'+'or');
  TamBarcos: array [1..5] of Byte = (5, 4, 3, 3, 2);
  Agua = '~';
  EsqX = 8;
  EsqY = 8;

type
  TDatoBarcos = record
    Nom: String[11];
    Tam, Hits: Byte;
    Destruido: Boolean;
    Horient: Char;
  end;

implementation
end.