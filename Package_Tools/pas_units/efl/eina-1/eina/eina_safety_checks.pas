unit eina_safety_checks;

interface

uses
  ctypes, efl, eina_error;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  EINA_ERROR_SAFETY_FAILED: TEina_Error; cvar;external libeina;

procedure _eina_safety_error(file_: pchar; func: pchar; line: longint; str: pchar); cdecl; external libeina;

// === Konventiert am: 16-5-25 19:49:11 ===


implementation



end.
