{$IFDEF read_interface}


type
  TDBusSignatureIter = record
    dummy1: pointer;
    dummy2: pointer;
    dummy8: Tdbus_uint32_t;
    dummy12: longint;
    dummy17: longint;
  end;
  PDBusSignatureIter = ^TDBusSignatureIter;

procedure dbus_signature_iter_init(iter: PDBusSignatureIter; signature: pchar); cdecl; external libdbus_1;
function dbus_signature_iter_get_current_type(iter: PDBusSignatureIter): longint; cdecl; external libdbus_1;
function dbus_signature_iter_get_signature(iter: PDBusSignatureIter): pchar; cdecl; external libdbus_1;
function dbus_signature_iter_get_element_type(iter: PDBusSignatureIter): longint; cdecl; external libdbus_1;
function dbus_signature_iter_next(iter: PDBusSignatureIter): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_signature_iter_recurse(iter: PDBusSignatureIter; subiter: PDBusSignatureIter); cdecl; external libdbus_1;
function dbus_signature_validate(signature: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_signature_validate_single(signature: pchar; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_type_is_valid(typecode: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_type_is_basic(typecode: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_type_is_container(typecode: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_type_is_fixed(typecode: longint): Tdbus_bool_t; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
