unit error;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTCOD_Error = ^TTCOD_Error;
  TTCOD_Error = longint;

const
  TCOD_E_OK = 0;
  TCOD_E_ERROR = -(1);
  TCOD_E_INVALID_ARGUMENT = -(2);
  TCOD_E_OUT_OF_MEMORY = -(3);
  TCOD_E_REQUIRES_ATTENTION = -(4);
  TCOD_E_WARN = 1;

function TCOD_get_error: pchar; cdecl; external libtcod;
function TCOD_set_error(msg: pchar): TTCOD_Error; cdecl; external libtcod;
function TCOD_set_errorf(fmt: pchar): TTCOD_Error; cdecl; varargs; external libtcod;
procedure TCOD_clear_error; cdecl; external libtcod;

// === Konventiert am: 6-9-25 15:48:13 ===


implementation



end.
