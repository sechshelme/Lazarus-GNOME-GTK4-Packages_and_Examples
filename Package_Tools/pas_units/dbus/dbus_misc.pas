unit dbus_misc;

interface

uses
  fp_dbus, dbus_errors, dbus_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function dbus_get_local_machine_id: pchar; cdecl; external libdbus_1;
procedure dbus_get_version(major_version_p: Plongint; minor_version_p: Plongint; micro_version_p: Plongint); cdecl; external libdbus_1;
function dbus_setenv(variable: pchar; value: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_try_get_local_machine_id(error: PDBusError): pchar; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:09 ===


implementation



end.
