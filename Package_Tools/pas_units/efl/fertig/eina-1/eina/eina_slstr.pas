unit eina_slstr;

interface

uses
  ctypes, efl, eina_tmpstr, eina_stringshare, eina_strbuf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Slstr = ^TEina_Slstr;
  TEina_Slstr = char;

function eina_slstr_copy_new(_string: pchar): PEina_Slstr; cdecl; external libeina;
function eina_slstr_copy_new_length(_string: pchar; len: Tsize_t): PEina_Slstr; cdecl; external libeina;
function eina_slstr_steal_new(_string: pchar): PEina_Slstr; cdecl; external libeina;
function eina_slstr_stringshare_new(_string: PEina_Stringshare): PEina_Slstr; cdecl; external libeina;
function eina_slstr_tmpstr_new(_string: PEina_Tmpstr): PEina_Slstr; cdecl; external libeina;
function eina_slstr_strbuf_new(_string: PEina_Strbuf): PEina_Slstr; cdecl; external libeina;
function eina_slstr_vasprintf_new(fmt: pchar; args: Tva_list): PEina_Slstr; cdecl; external libeina;

//static inline Eina_Slstr *
//eina_slstr_printf(const char *fmt, ...)
//{
//   Eina_Slstr *str;
//   va_list args;
//
//   va_start(args, fmt);
//   str = eina_slstr_vasprintf_new(fmt, args);
//   va_end(args);
//
//   return str;
//}

procedure eina_slstr_local_clear; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:00:24 ===


implementation



end.
