unit eina_hamster;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_hamster_count: longint; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:31:59 ===


implementation



end.
