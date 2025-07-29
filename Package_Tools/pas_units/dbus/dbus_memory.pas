unit dbus_memory;

interface

uses
  fp_dbus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function dbus_malloc(bytes: Tsize_t): pointer; cdecl; external libdbus_1;
function dbus_malloc0(bytes: Tsize_t): pointer; cdecl; external libdbus_1;
function dbus_realloc(memory: pointer; bytes: Tsize_t): pointer; cdecl; external libdbus_1;
procedure dbus_free(memory: pointer); cdecl; external libdbus_1;
procedure dbus_free_string_array(str_array: PPchar); cdecl; external libdbus_1;

type
  TDBusFreeFunction = procedure(memory: pointer); cdecl;

procedure dbus_shutdown; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:04 ===


implementation


end.
