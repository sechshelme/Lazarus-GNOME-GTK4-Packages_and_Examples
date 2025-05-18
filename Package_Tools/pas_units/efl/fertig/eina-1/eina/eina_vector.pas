unit eina_vector;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEina_Vector2 = record
    x: double;
    y: double;
  end;
  PEina_Vector2 = ^TEina_Vector2;

  TEina_Vector3 = record
    x: double;
    y: double;
    z: double;
  end;
  PEina_Vector3 = ^TEina_Vector3;


  // === Konventiert am: 15-5-25 17:13:12 ===


implementation



end.
