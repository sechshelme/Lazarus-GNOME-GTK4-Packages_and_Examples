unit eina_stringshare;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Stringshare = ^TEina_Stringshare;
  TEina_Stringshare = char;

function eina_stringshare_add_length(str: pchar; slen: dword): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_add(str: pchar): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_printf(fmt: pchar; args: array of const): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_printf(fmt: pchar): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_vprintf(fmt: pchar; args: Tva_list): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_nprintf(len: dword; fmt: pchar; args: array of const): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_nprintf(len: dword; fmt: pchar): PEina_Stringshare; cdecl; external libeina;
function eina_stringshare_ref(str: PEina_Stringshare): PEina_Stringshare; cdecl; external libeina;
procedure eina_stringshare_del(str: PEina_Stringshare); cdecl; external libeina;
function eina_stringshare_strlen(str: PEina_Stringshare): longint; cdecl; external libeina;
procedure eina_stringshare_dump; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:13:04 ===


implementation



end.
