unit eina_util;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function eina_environment_home_get: pchar; cdecl; external libeina;
function eina_environment_tmp_get: pchar; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:24:11 ===


implementation



end.
