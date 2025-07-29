unit dbus_address;

interface

uses
  fp_dbus, dbus_types, dbus_errors;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDBusAddressEntry = type Pointer;
  PPDBusAddressEntry = PDBusAddressEntry;
  PPPDBusAddressEntry = PPDBusAddressEntry;

function dbus_parse_address(address: pchar; entry_result: PPPDBusAddressEntry; array_len: Plongint; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_address_entry_get_value(entry: PDBusAddressEntry; key: pchar): pchar; cdecl; external libdbus_1;
function dbus_address_entry_get_method(entry: PDBusAddressEntry): pchar; cdecl; external libdbus_1;
procedure dbus_address_entries_free(entries: PPDBusAddressEntry); cdecl; external libdbus_1;
function dbus_address_escape_value(value: pchar): pchar; cdecl; external libdbus_1;
function dbus_address_unescape_value(value: pchar; error: PDBusError): pchar; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:06:51 ===


implementation



end.
