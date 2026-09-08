{$IFDEF read_interface}


type
  PPkBitfield = ^TPkBitfield;
  TPkBitfield = Tguint64;

const
  PK_BITFIELD_FORMAT = G_GUINT64_FORMAT;

function pk_bitfield_contain_priority(values: TPkBitfield; value: Tgint): Tgint; cdecl; varargs; external libpackagekit;
function pk_bitfield_from_enums(value: Tgint): TPkBitfield; cdecl; varargs; external libpackagekit;
function pk_role_bitfield_from_string(roles: Pgchar): TPkBitfield; cdecl; external libpackagekit;
function pk_role_bitfield_to_string(roles: TPkBitfield): Pgchar; cdecl; external libpackagekit;
function pk_group_bitfield_from_string(groups: Pgchar): TPkBitfield; cdecl; external libpackagekit;
function pk_group_bitfield_to_string(groups: TPkBitfield): Pgchar; cdecl; external libpackagekit;
function pk_filter_bitfield_from_string(filters: Pgchar): TPkBitfield; cdecl; external libpackagekit;
function pk_filter_bitfield_to_string(filters: TPkBitfield): Pgchar; cdecl; external libpackagekit;
function pk_transaction_flag_bitfield_from_string(transaction_flags: Pgchar): TPkBitfield; cdecl; external libpackagekit;
function pk_transaction_flag_bitfield_to_string(transaction_flags: TPkBitfield): Pgchar; cdecl; external libpackagekit;

function pk_bitfield_value(anEnum: integer): TPkBitfield; inline;
function pk_bitfield_contain(bitfield: TPkBitfield; anEnum: integer): boolean; inline;
procedure pk_bitfield_add(var bitfield: TPkBitfield; anEnum: integer); inline;
procedure pk_bitfield_remove(var bitfield: TPkBitfield; anEnum: integer); inline;
procedure pk_bitfield_invert(var bitfield: TPkBitfield; anEnum: integer); inline;


// === Konventiert am: 7-9-26 15:04:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function pk_bitfield_value(anEnum: integer): TPkBitfield;
begin
  Result := TPkBitfield(1) shl anEnum;
end;

function pk_bitfield_contain(bitfield: TPkBitfield; anEnum: integer): boolean;
begin
  Result := (bitfield and pk_bitfield_value(anEnum)) > 0;
end;

procedure pk_bitfield_add(var bitfield: TPkBitfield; anEnum: integer);
begin
  bitfield := bitfield or pk_bitfield_value(anEnum);
end;

procedure pk_bitfield_remove(var bitfield: TPkBitfield; anEnum: integer);
begin
  bitfield := bitfield and not pk_bitfield_value(anEnum);
end;

procedure pk_bitfield_invert(var bitfield: TPkBitfield; anEnum: integer);
begin
  bitfield := bitfield xor pk_bitfield_value(anEnum);
end;

{$ENDIF read_implementation}
