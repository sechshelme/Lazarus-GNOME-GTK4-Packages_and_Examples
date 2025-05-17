unit eina_refcount;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEina_Refcount = ^TEina_Refcount;
  TEina_Refcount = longint;

  // === Konventiert am: 17-5-25 16:24:02 ===


implementation



end.
