unit Efreet;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EFREET_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EFREET_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEfreet_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEfreet_Version = ^TEfreet_Version;

var
  efreet_version: PEfreet_Version; cvar;external libefreet;

function efreet_init: longint; cdecl; external libefreet;
function efreet_shutdown: longint; cdecl; external libefreet;
procedure efreet_lang_reset; cdecl; external libefreet;
procedure efreet_cache_disable; cdecl; external libefreet;
procedure efreet_cache_enable; cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:07 ===


implementation



end.
