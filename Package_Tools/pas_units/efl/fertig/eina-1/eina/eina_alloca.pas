unit eina_alloca;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function alloca(size: Tsize_t): pointer; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:52:04 ===


implementation



end.
