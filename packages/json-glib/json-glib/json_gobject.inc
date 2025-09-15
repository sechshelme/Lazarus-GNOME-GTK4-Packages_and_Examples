{$IFDEF read_interface}


type
  PJsonSerializable = type Pointer;

  TJsonSerializableIface = record
    g_iface: TGTypeInterface;
    serialize_property: function(serializable: PJsonSerializable; property_name: Pgchar; value: PGValue; pspec: PGParamSpec): PJsonNode; cdecl;
    deserialize_property: function(serializable: PJsonSerializable; property_name: Pgchar; value: PGValue; pspec: PGParamSpec; property_node: PJsonNode): Tgboolean; cdecl;
    find_property: function(serializable: PJsonSerializable; name: pchar): PGParamSpec; cdecl;
    list_properties: function(serializable: PJsonSerializable; n_pspecs: Pguint): PPGParamSpec; cdecl;
    set_property: procedure(serializable: PJsonSerializable; pspec: PGParamSpec; value: PGValue); cdecl;
    get_property: procedure(serializable: PJsonSerializable; pspec: PGParamSpec; value: PGValue); cdecl;
  end;
  PJsonSerializableIface = ^TJsonSerializableIface;

function json_serializable_get_type: TGType; cdecl; external libjsonglib;
function json_serializable_serialize_property(serializable: PJsonSerializable; property_name: Pgchar; value: PGValue; pspec: PGParamSpec): PJsonNode; cdecl; external libjsonglib;
function json_serializable_deserialize_property(serializable: PJsonSerializable; property_name: Pgchar; value: PGValue; pspec: PGParamSpec; property_node: PJsonNode): Tgboolean; cdecl; external libjsonglib;
function json_serializable_find_property(serializable: PJsonSerializable; name: pchar): PGParamSpec; cdecl; external libjsonglib;
function json_serializable_list_properties(serializable: PJsonSerializable; n_pspecs: Pguint): PPGParamSpec; cdecl; external libjsonglib;
procedure json_serializable_set_property(serializable: PJsonSerializable; pspec: PGParamSpec; value: PGValue); cdecl; external libjsonglib;
procedure json_serializable_get_property(serializable: PJsonSerializable; pspec: PGParamSpec; value: PGValue); cdecl; external libjsonglib;
function json_serializable_default_serialize_property(serializable: PJsonSerializable; property_name: Pgchar; value: PGValue; pspec: PGParamSpec): PJsonNode; cdecl; external libjsonglib;
function json_serializable_default_deserialize_property(serializable: PJsonSerializable; property_name: Pgchar; value: PGValue; pspec: PGParamSpec; property_node: PJsonNode): Tgboolean; cdecl; external libjsonglib;

type
  TJsonBoxedSerializeFunc = function(boxed: Tgconstpointer): PJsonNode; cdecl;
  TJsonBoxedDeserializeFunc = function(node: PJsonNode): Tgpointer; cdecl;

procedure json_boxed_register_serialize_func(gboxed_type: TGType; node_type: TJsonNodeType; serialize_func: TJsonBoxedSerializeFunc); cdecl; external libjsonglib;
procedure json_boxed_register_deserialize_func(gboxed_type: TGType; node_type: TJsonNodeType; deserialize_func: TJsonBoxedDeserializeFunc); cdecl; external libjsonglib;
function json_boxed_can_serialize(gboxed_type: TGType; node_type: PJsonNodeType): Tgboolean; cdecl; external libjsonglib;
function json_boxed_can_deserialize(gboxed_type: TGType; node_type: TJsonNodeType): Tgboolean; cdecl; external libjsonglib;
function json_boxed_serialize(gboxed_type: TGType; boxed: Tgconstpointer): PJsonNode; cdecl; external libjsonglib;
function json_boxed_deserialize(gboxed_type: TGType; node: PJsonNode): Tgpointer; cdecl; external libjsonglib;
function json_gobject_serialize(gobject: PGObject): PJsonNode; cdecl; external libjsonglib;
function json_gobject_deserialize(gtype: TGType; node: PJsonNode): PGObject; cdecl; external libjsonglib;
function json_gobject_from_data(gtype: TGType; data: Pgchar; length: Tgssize; error: PPGError): PGObject; cdecl; external libjsonglib;
function json_gobject_to_data(gobject: PGObject; length: Pgsize): Pgchar; cdecl; external libjsonglib;
function json_construct_gobject(gtype: TGType; data: Pgchar; length: Tgsize; error: PPGError): PGObject; cdecl; external libjsonglib; deprecated;
function json_serialize_gobject(gobject: PGObject; length: Pgsize): Pgchar; cdecl; external libjsonglib; deprecated;

// === Konventiert am: 15-9-25 13:28:28 ===

function JSON_TYPE_SERIALIZABLE: TGType;
function JSON_SERIALIZABLE(obj: Pointer): PJsonSerializable;
function JSON_IS_SERIALIZABLE(obj: Pointer): Tgboolean;
function JSON_SERIALIZABLE_GET_IFACE(obj: Pointer): PJsonSerializableIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function JSON_TYPE_SERIALIZABLE: TGType;
begin
  JSON_TYPE_SERIALIZABLE := json_serializable_get_type;
end;

function JSON_SERIALIZABLE(obj: Pointer): PJsonSerializable;
begin
  Result := PJsonSerializable(g_type_check_instance_cast(obj, JSON_TYPE_SERIALIZABLE));
end;

function JSON_IS_SERIALIZABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSON_TYPE_SERIALIZABLE);
end;

function JSON_SERIALIZABLE_GET_IFACE(obj: Pointer): PJsonSerializableIface;
begin
  Result := g_type_interface_peek(obj, JSON_TYPE_SERIALIZABLE);
end;



{$ENDIF read_implementation}
