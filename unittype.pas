unit UnitType;

interface

const
  NombresBarcos: array [1..5] of String[11] = 
    ('Portaviones', 'Acorazado', 'Crucero', 'Submarino', 'Destruct'+'or');

type
  TDatoBarcos = record
    Nom: String[11];
    Tam, Hits: Byte;
    Destruido: Boolean;
    Horient: Char;
  end;

implementation
end.