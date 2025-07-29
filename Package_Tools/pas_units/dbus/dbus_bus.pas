unit dbus_bus;

interface

uses
  fp_dbus, lib_dbus_arch_deps, dbus_types, dbus_errors, dbus_shared, dbus_connection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function dbus_bus_get(_type: TDBusBusType; error: PDBusError): PDBusConnection; cdecl; external libdbus_1;
function dbus_bus_get_private(_type: TDBusBusType; error: PDBusError): PDBusConnection; cdecl; external libdbus_1;
function dbus_bus_register(connection: PDBusConnection; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_bus_set_unique_name(connection: PDBusConnection; unique_name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_bus_get_unique_name(connection: PDBusConnection): pchar; cdecl; external libdbus_1;
function dbus_bus_get_unix_user(connection: PDBusConnection; name: pchar; error: PDBusError): dword; cdecl; external libdbus_1;
function dbus_bus_get_id(connection: PDBusConnection; error: PDBusError): pchar; cdecl; external libdbus_1;
function dbus_bus_request_name(connection: PDBusConnection; name: pchar; flags: dword; error: PDBusError): longint; cdecl; external libdbus_1;
function dbus_bus_release_name(connection: PDBusConnection; name: pchar; error: PDBusError): longint; cdecl; external libdbus_1;
function dbus_bus_name_has_owner(connection: PDBusConnection; name: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_bus_start_service_by_name(connection: PDBusConnection; name: pchar; flags: Tdbus_uint32_t; reply: Pdbus_uint32_t; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_bus_add_match(connection: PDBusConnection; rule: pchar; error: PDBusError); cdecl; external libdbus_1;
procedure dbus_bus_remove_match(connection: PDBusConnection; rule: pchar; error: PDBusError); cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:06:55 ===


implementation



end.
