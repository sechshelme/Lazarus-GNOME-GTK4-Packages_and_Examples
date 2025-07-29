unit dbus_server;

interface

uses
  fp_dbus, lib_dbus_arch_deps, dbus_types, dbus_connection, dbus_errors, dbus_memory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDBusServer = type Pointer;

  TDBusNewConnectionFunction = procedure(server: PDBusServer; new_connection: PDBusConnection; data: pointer); cdecl;

function dbus_server_listen(address: pchar; error: PDBusError): PDBusServer; cdecl; external libdbus_1;
function dbus_server_ref(server: PDBusServer): PDBusServer; cdecl; external libdbus_1;
procedure dbus_server_unref(server: PDBusServer); cdecl; external libdbus_1;
procedure dbus_server_disconnect(server: PDBusServer); cdecl; external libdbus_1;
function dbus_server_get_is_connected(server: PDBusServer): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_server_get_address(server: PDBusServer): pchar; cdecl; external libdbus_1;
function dbus_server_get_id(server: PDBusServer): pchar; cdecl; external libdbus_1;
procedure dbus_server_set_new_connection_function(server: PDBusServer; _function: TDBusNewConnectionFunction; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
function dbus_server_set_watch_functions(server: PDBusServer; add_function: TDBusAddWatchFunction; remove_function: TDBusRemoveWatchFunction; toggled_function: TDBusWatchToggledFunction; data: pointer;
  free_data_function: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_server_set_timeout_functions(server: PDBusServer; add_function: TDBusAddTimeoutFunction; remove_function: TDBusRemoveTimeoutFunction; toggled_function: TDBusTimeoutToggledFunction; data: pointer;
  free_data_function: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_server_set_auth_mechanisms(server: PDBusServer; mechanisms: PPchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_server_allocate_data_slot(slot_p: Pdbus_int32_t): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_server_free_data_slot(slot_p: Pdbus_int32_t); cdecl; external libdbus_1;
function dbus_server_set_data(server: PDBusServer; slot: longint; data: pointer; free_data_func: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_server_get_data(server: PDBusServer; slot: longint): pointer; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:18 ===


implementation



end.
