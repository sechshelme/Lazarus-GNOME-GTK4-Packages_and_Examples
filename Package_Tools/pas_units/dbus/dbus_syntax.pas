unit dbus_syntax;

interface

uses
  fp_dbus, dbus_types, dbus_errors;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function dbus_validate_path(path: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_validate_interface(name: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_validate_member(name: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_validate_error_name(name: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_validate_bus_name(name: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:29 ===


implementation



end.
