unit eina_main;

interface

uses
  ctypes, efl, Efl_Config, eina_types, eina_error;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EINA_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EINA_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEina_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEina_Version = ^TEina_Version;

var
  eina_version: PEina_Version; cvar;external libeina;
  EINA_ERROR_NOT_IMPLEMENTED: TEina_Error; cvar;external libeina;

function eina_init: longint; cdecl; external libeina;
function eina_shutdown: longint; cdecl; external libeina;
function eina_threads_init: longint; cdecl; external libeina;
function eina_threads_shutdown: longint; cdecl; external libeina;
function eina_main_loop_is: TEina_Bool; cdecl; external libeina;
procedure eina_main_loop_define; cdecl; external libeina;

// === Konventiert am: 17-5-25 15:25:44 ===


implementation



end.
