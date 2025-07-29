{$IFDEF read_interface}


type
  TDBusError = bitpacked record
    name: pchar;
    message: pchar;
    dummy1: 0..1;
    dummy2: 0..1;
    dummy3: 0..1;
    dummy4: 0..1;
    dummy5: 0..1;
    padding1: pointer;
  end;
  PDBusError = ^TDBusError;

const
  DBUS_ERROR_INIT_: TDBusError = (
    name: nil;
    message: nil;
    dummy1: 1;
    dummy2: 0;
    dummy3: 0;
    dummy4: 0;
    dummy5: 0;
    padding1: nil);

procedure dbus_error_init(error: PDBusError); cdecl; external libdbus_1;
procedure dbus_error_free(error: PDBusError); cdecl; external libdbus_1;
procedure dbus_set_error(error: PDBusError; name: pchar; message: pchar; args: array of const); cdecl; external libdbus_1;
procedure dbus_set_error(error: PDBusError; name: pchar; message: pchar); cdecl; external libdbus_1;
procedure dbus_set_error_const(error: PDBusError; name: pchar; message: pchar); cdecl; external libdbus_1;
procedure dbus_move_error(src: PDBusError; dest: PDBusError); cdecl; external libdbus_1;
function dbus_error_has_name(error: PDBusError; name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_error_is_set(error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
