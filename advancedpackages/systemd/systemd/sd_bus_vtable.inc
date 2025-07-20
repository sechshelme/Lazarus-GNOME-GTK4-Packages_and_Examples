{$IFDEF read_interface}


const
  _SD_BUS_VTABLE_START = '<';
  _SD_BUS_VTABLE_END = '>';
  _SD_BUS_VTABLE_METHOD = 'M';
  _SD_BUS_VTABLE_SIGNAL = 'S';
  _SD_BUS_VTABLE_PROPERTY = 'P';
  _SD_BUS_VTABLE_WRITABLE_PROPERTY = 'W';

const
  SD_BUS_VTABLE_DEPRECATED = 1 shl 0;
  SD_BUS_VTABLE_HIDDEN = 1 shl 1;
  SD_BUS_VTABLE_UNPRIVILEGED = 1 shl 2;
  SD_BUS_VTABLE_METHOD_NO_REPLY = 1 shl 3;
  SD_BUS_VTABLE_PROPERTY_CONST = 1 shl 4;
  SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE = 1 shl 5;
  SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION = 1 shl 6;
  SD_BUS_VTABLE_PROPERTY_EXPLICIT = 1 shl 7;
  SD_BUS_VTABLE_SENSITIVE = 1 shl 8;
  SD_BUS_VTABLE_ABSOLUTE_OFFSET = 1 shl 9;
  _SD_BUS_VTABLE_CAPABILITY_MASK = $FFFF shl 40;

function SD_BUS_VTABLE_CAPABILITY(x: uint64): uint64;

const
  _SD_BUS_VTABLE_PARAM_NAMES = 1 shl 0;

var
  sd_bus_object_vtable_format: dword; cvar;external libsystemd;

  // === Konventiert am: 16-7-25 19:03:45 ===

 function SD_BUS_VTABLE_START(flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_METHOD_WITH_NAMES_OFFSET(_member, _signature, _in_names, _result, _out_names: PChar; _handler: Tsd_bus_message_handler_t; _offset: nativeuint; _flags: uint64): Tsd_bus_vtable;
 function SD_BUS_METHOD_WITH_OFFSET(_member, _signature, _result: PAnsiChar; _handler: Tsd_bus_message_handler_t; _offset: NativeUInt; _flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_METHOD_WITH_NAMES(_member, _signature, _in_names, _result, _out_names: PAnsiChar; _handler: Tsd_bus_message_handler_t; _flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_METHOD(_member, _signature, _result: PAnsiChar; _handler: Tsd_bus_message_handler_t; _flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_SIGNAL_WITH_NAMES(_member, _signature, _out_names: PAnsiChar; _flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_SIGNAL(_member, _signature: PAnsiChar;    _flags: UInt64  ): Tsd_bus_vtable;
 function SD_BUS_PROPERTY(_member, _signature: PAnsiChar; _get: Tsd_bus_property_get_t; _offset: NativeUInt; _flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_WRITABLE_PROPERTY(_member, _signature: PAnsiChar; _get:Tsd_bus_property_get_t; _set: Tsd_bus_property_set_t; _offset: NativeUInt; _flags: UInt64): Tsd_bus_vtable;
 function SD_BUS_VTABLE_END(): Tsd_bus_vtable;

 // === Eigenes ===

 type
   Tsd_bus_vtables = array of Tsd_bus_vtable;

 procedure Add_bus_vtable(var Tables: Tsd_bus_vtables; t: Tsd_bus_vtable);


{$ENDIF read_interface}


{$IFDEF read_implementation}

// === Eigenes ===

procedure Add_bus_vtable(var Tables: Tsd_bus_vtables; t: Tsd_bus_vtable);
var
  len: SizeInt;
begin
  len := Length(Tables);
  SetLength(Tables, len + 1);
  Tables[len] := t;
end;

// ================




function SD_BUS_VTABLE_START(flags: UInt64): Tsd_bus_vtable;
begin
  Result.type_ := _SD_BUS_VTABLE_START;
  Result.flags := flags;
  Result.start.element_size := SizeOf(Tsd_bus_vtable);
  Result.start.features := _SD_BUS_VTABLE_PARAM_NAMES;
  Result.start.vtable_format_reference := @sd_bus_object_vtable_format;
end;

function SD_BUS_METHOD_WITH_NAMES_OFFSET(_member, _signature, _in_names, _result, _out_names: PChar; _handler: Tsd_bus_message_handler_t; _offset: nativeuint; _flags: uint64): Tsd_bus_vtable;
begin
  Result.type_ := _SD_BUS_VTABLE_METHOD;
  Result.flags := _flags;
  Result.method.member := _member;
  Result.method.signature := _signature;
  Result.method.result_ := _result;
  Result.method.handler := _handler;
  Result.method.offset := _offset;
  Result.method.names :=pchar(String( _in_names) + String( _out_names));
end;

function SD_BUS_METHOD_WITH_OFFSET(_member, _signature, _result: PAnsiChar; _handler: Tsd_bus_message_handler_t; _offset: NativeUInt; _flags: UInt64): Tsd_bus_vtable;
begin
  Result := SD_BUS_METHOD_WITH_NAMES_OFFSET(_member, _signature, '', _result, '', _handler, _offset, _flags);
end;

function SD_BUS_METHOD_WITH_NAMES(_member, _signature, _in_names, _result,_out_names: PAnsiChar; _handler: Tsd_bus_message_handler_t; _flags: UInt64): Tsd_bus_vtable;
begin
  Result := SD_BUS_METHOD_WITH_NAMES_OFFSET(_member, _signature, _in_names, _result, _out_names, _handler, 0, _flags);
end;

function SD_BUS_METHOD(_member, _signature, _result: PAnsiChar; _handler: Tsd_bus_message_handler_t; _flags: UInt64): Tsd_bus_vtable;
begin
  Result := SD_BUS_METHOD_WITH_NAMES_OFFSET(_member, _signature, '', _result, '', _handler, 0, _flags);
end;

function SD_BUS_SIGNAL_WITH_NAMES(_member, _signature, _out_names: PAnsiChar;_flags: UInt64): Tsd_bus_vtable;
begin
  Result.type_ := _SD_BUS_VTABLE_SIGNAL;
  Result.flags := _flags;
  Result.signal.member := _member;
  Result.signal.signature := _signature;
  Result.signal.names := _out_names;
end;

function SD_BUS_SIGNAL(_member, _signature: PAnsiChar; _flags: UInt64): Tsd_bus_vtable;
begin
  Result := SD_BUS_SIGNAL_WITH_NAMES(_member, _signature, '', _flags);
end;

function SD_BUS_PROPERTY(_member, _signature: PAnsiChar; _get: Tsd_bus_property_get_t; _offset: NativeUInt; _flags: UInt64): Tsd_bus_vtable;
begin
  Result.type_ := _SD_BUS_VTABLE_PROPERTY;
  Result.flags := _flags;
  Result.property_.member := _member;
  Result.property_.signature := _signature;
  Result.property_.get_ := _get;
  Result.property_.set_ := nil;
  Result.property_.offset := _offset;
end;

function SD_BUS_WRITABLE_PROPERTY(_member, _signature: PAnsiChar; _get: Tsd_bus_property_get_t; _set: Tsd_bus_property_set_t; _offset: NativeUInt; _flags: UInt64): Tsd_bus_vtable;
begin
  Result.type_ := _SD_BUS_VTABLE_WRITABLE_PROPERTY;
  Result.flags := _flags;
  Result.property_.member := _member;
  Result.property_.signature := _signature;
  Result.property_.get_ := _get;
  Result.property_.set_ := _set;
  Result.property_.offset := _offset;
end;

function SD_BUS_VTABLE_END(): Tsd_bus_vtable;
begin
  Result.type_ := _SD_BUS_VTABLE_END;
  Result.flags := 0;
  Result._end._reserved := 0;
end;

// ============================


function SD_BUS_VTABLE_CAPABILITY(x: uint64): uint64;
begin
  SD_BUS_VTABLE_CAPABILITY := uint64(((x + 1) and $FFFF) shl 40);
end;



{$ENDIF read_implementation}
