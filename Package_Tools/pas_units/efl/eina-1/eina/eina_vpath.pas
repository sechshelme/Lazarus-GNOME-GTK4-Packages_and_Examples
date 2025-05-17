unit eina_vpath;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Vpath = ^TEina_Vpath;
  TEina_Vpath = pchar;

function eina_vpath_resolve(path: TEina_Vpath): pchar; cdecl; external libeina;
function eina_vpath_resolve_snprintf(str: pchar; size: Tsize_t; format: pchar; args: array of const): longint; cdecl; external libeina;
function eina_vpath_resolve_snprintf(str: pchar; size: Tsize_t; format: pchar): longint; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:00:34 ===


implementation



end.
