unit eina_trash;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEina_Trash = ^TEina_Trash;

  TEina_Trash = record
    next: PEina_Trash;
  end;

  // === Konventiert am: 17-5-25 16:00:27 ===


implementation



end.
