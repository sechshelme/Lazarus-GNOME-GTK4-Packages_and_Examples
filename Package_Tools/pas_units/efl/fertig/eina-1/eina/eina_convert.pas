unit eina_convert;

interface

uses
  ctypes, efl, eina_types, eina_error, eina_fp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  EINA_ERROR_CONVERT_P_NOT_FOUND: TEina_Error; cvar;external libeina;
  EINA_ERROR_CONVERT_0X_NOT_FOUND: TEina_Error; cvar;external libeina;
  EINA_ERROR_CONVERT_OUTRUN_STRING_LENGTH: TEina_Error; cvar;external libeina;

function eina_convert_itoa(n: longint; s: pchar): longint; cdecl; external libeina;
function eina_convert_xtoa(n: dword; s: pchar): longint; cdecl; external libeina;
function eina_convert_dtoa(d: double; des: pchar): longint; cdecl; external libeina;
function eina_convert_atod(src: pchar; length: longint; m: Pint64; e: Plongint): TEina_Bool; cdecl; external libeina;
function eina_convert_fptoa(fp: TEina_F32p32; des: pchar): longint; cdecl; external libeina;
function eina_convert_atofp(src: pchar; length: longint; fp: PEina_F32p32): TEina_Bool; cdecl; external libeina;
function eina_convert_strtod_c(nptr: pchar; endptr: PPchar): double; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:02:14 ===


implementation



end.
