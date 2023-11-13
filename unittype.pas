unit UnitType;

interface

const
  NombresBarcos: array [1..5] of String[11] = 
    ('Portaviones', 'Acorazado', 'Crucero', 'Submarino', 'Destruct'+'or');
  TamBarcos: array [1..5] of Byte = (5, 4, 3, 3, 2);
  Agua = '~';
  
  EsqXA = 8;
  EsqYA = 18;

  EsqXB = 25;
  EsqYB = 18;

  DespConst = 13;

type
  TDatoBarcos = record
    Nom: String[11];
    Tam, Hits: Byte;
    Destruido: Boolean;
    Horient: Char;
  end;

implementation
end.