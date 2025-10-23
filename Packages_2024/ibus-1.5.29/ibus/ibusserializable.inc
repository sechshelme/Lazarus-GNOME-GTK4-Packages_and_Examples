{$IFDEF read_interface}


type
  PIBusSerializablePrivate = type Pointer;

  TIBusSerializable = record
    parent: TIBusObject;
    priv: PIBusSerializablePrivate;
  end;
  PIBusSerializable = ^TIBusSerializable;

  TIBusSerializableSerializeFunc = function(serializable: PIBusSerializable; builder: PGVariantBuilder): Tgboolean; cdecl;
  TIBusSerializableDeserializeFunc = function(serializable: PIBusSerializable; variant: PGVariant): Tgint; cdecl;
  TIBusSerializableCopyFunc = function(dest: PIBusSerializable; src: PIBusSerializable): Tgboolean; cdecl;

  TIBusSerializableClass = record
    parent: TIBusObjectClass;
    serialize: function(obj: PIBusSerializable; builder: PGVariantBuilder): Tgboolean; cdecl;
    deserialize: function(obj: PIBusSerializable; variant: PGVariant): Tgint; cdecl;
    copy: function(dest: PIBusSerializable; src: PIBusSerializable): Tgboolean; cdecl;
    pdummy: array[0..4] of Tgpointer;
  end;
  PIBusSerializableClass = ^TIBusSerializableClass;

function ibus_serializable_get_type: TGType; cdecl; external libibus;
function ibus_serializable_new: PIBusSerializable; cdecl; external libibus;
procedure ibus_serializable_set_qattachment(serializable: PIBusSerializable; key: TGQuark; value: PGVariant); cdecl; external libibus;
function ibus_serializable_get_qattachment(serializable: PIBusSerializable; key: TGQuark): PGVariant; cdecl; external libibus;
procedure ibus_serializable_remove_qattachment(serializable: PIBusSerializable; key: TGQuark); cdecl; external libibus;
function ibus_serializable_copy(serializable: PIBusSerializable): PIBusSerializable; cdecl; external libibus;
function ibus_serializable_serialize_object(serializable: PIBusSerializable): PGVariant; cdecl; external libibus;
function ibus_serializable_deserialize_object(variant: PGVariant): PIBusSerializable; cdecl; external libibus;

function ibus_serializable_serialize(serializable: PIBusSerializable): PGVariant; cdecl; external libibus name 'ibus_serializable_serialize_object';
function ibus_serializable_deserialize(variant: PGVariant): PIBusSerializable; cdecl; external libibus name 'ibus_serializable_deserialize_object';

procedure ibus_serializable_set_attachment(o:PIBusSerializable; k:PChar; v: PGVariant);
function ibus_serializable_get_attachment(o:PIBusSerializable; k: PChar): PGVariant;
procedure ibus_serializable_remove_attachment(o:PIBusSerializable; k: PChar);

// === Konventiert am: 25-7-25 16:58:26 ===

function IBUS_TYPE_SERIALIZABLE: TGType;
function IBUS_SERIALIZABLE(obj: Pointer): PIBusSerializable;
function IBUS_SERIALIZABLE_CLASS(klass: Pointer): PIBusSerializableClass;
function IBUS_IS_SERIALIZABLE(obj: Pointer): Tgboolean;
function IBUS_IS_SERIALIZABLE_CLASS(klass: Pointer): Tgboolean;
function IBUS_SERIALIZABLE_GET_CLASS(obj: Pointer): PIBusSerializableClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_SERIALIZABLE: TGType;
begin
  IBUS_TYPE_SERIALIZABLE := ibus_serializable_get_type;
end;

function IBUS_SERIALIZABLE(obj: Pointer): PIBusSerializable;
begin
  Result := PIBusSerializable(g_type_check_instance_cast(obj, IBUS_TYPE_SERIALIZABLE));
end;

function IBUS_SERIALIZABLE_CLASS(klass: Pointer): PIBusSerializableClass;
begin
  Result := PIBusSerializableClass(g_type_check_class_cast(klass, IBUS_TYPE_SERIALIZABLE));
end;

function IBUS_IS_SERIALIZABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_SERIALIZABLE);
end;

function IBUS_IS_SERIALIZABLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_SERIALIZABLE);
end;

function IBUS_SERIALIZABLE_GET_CLASS(obj: Pointer): PIBusSerializableClass;
begin
  Result := PIBusSerializableClass(PGTypeInstance(obj)^.g_class);
end;

// ===============


procedure ibus_serializable_set_attachment(o: PIBusSerializable; k: PChar;  v: PGVariant);
begin
  ibus_serializable_set_qattachment(o, g_quark_from_string(k), v);
end;

function ibus_serializable_get_attachment(o: PIBusSerializable; k: PChar  ): PGVariant;
begin
  ibus_serializable_get_attachment := ibus_serializable_get_qattachment(o, g_quark_from_string(k));
end;

procedure ibus_serializable_remove_attachment(o: PIBusSerializable; k: PChar);
begin
  ibus_serializable_remove_qattachment(o, g_quark_from_string(k));
end;


{$ENDIF read_implementation}
