{$IFDEF read_interface}

type
  PJsonNode = type Pointer;
  PPJsonNode = ^PJsonNode;
  PJsonObject = type Pointer;
  PJsonArray = type Pointer;

type
  PJsonNodeType = ^TJsonNodeType;
  TJsonNodeType = longint;

const
  JSON_NODE_OBJECT = 0;
  JSON_NODE_ARRAY = 1;
  JSON_NODE_VALUE = 2;
  JSON_NODE_NULL = 3;

type
  TJsonObjectForeach = procedure(obj: PJsonObject; member_name: Pgchar; member_node: PJsonNode; user_data: Tgpointer); cdecl;
  TJsonArrayForeach = procedure(arr: PJsonArray; index_: Tguint; element_node: PJsonNode; user_data: Tgpointer); cdecl;

function json_node_get_type: TGType; cdecl; external libjsonglib;
function json_node_new(_type: TJsonNodeType): PJsonNode; cdecl; external libjsonglib;
function json_node_alloc: PJsonNode; cdecl; external libjsonglib;
function json_node_init(node: PJsonNode; _type: TJsonNodeType): PJsonNode; cdecl; external libjsonglib;
function json_node_init_object(node: PJsonNode; obj: PJsonObject): PJsonNode; cdecl; external libjsonglib;
function json_node_init_array(node: PJsonNode; arr: PJsonArray): PJsonNode; cdecl; external libjsonglib;
function json_node_init_int(node: PJsonNode; value: Tgint64): PJsonNode; cdecl; external libjsonglib;
function json_node_init_double(node: PJsonNode; value: Tgdouble): PJsonNode; cdecl; external libjsonglib;
function json_node_init_boolean(node: PJsonNode; value: Tgboolean): PJsonNode; cdecl; external libjsonglib;
function json_node_init_string(node: PJsonNode; value: pchar): PJsonNode; cdecl; external libjsonglib;
function json_node_init_null(node: PJsonNode): PJsonNode; cdecl; external libjsonglib;
function json_node_copy(node: PJsonNode): PJsonNode; cdecl; external libjsonglib;
procedure json_node_free(node: PJsonNode); cdecl; external libjsonglib;
function json_node_ref(node: PJsonNode): PJsonNode; cdecl; external libjsonglib;
procedure json_node_unref(node: PJsonNode); cdecl; external libjsonglib;
function json_node_get_node_type(node: PJsonNode): TJsonNodeType; cdecl; external libjsonglib;
function json_node_get_value_type(node: PJsonNode): TGType; cdecl; external libjsonglib;
procedure json_node_set_parent(node: PJsonNode; parent: PJsonNode); cdecl; external libjsonglib;
function json_node_get_parent(node: PJsonNode): PJsonNode; cdecl; external libjsonglib;
function json_node_type_name(node: PJsonNode): Pgchar; cdecl; external libjsonglib;
procedure json_node_set_object(node: PJsonNode; obj: PJsonObject); cdecl; external libjsonglib;
procedure json_node_take_object(node: PJsonNode; obj: PJsonObject); cdecl; external libjsonglib;
function json_node_get_object(node: PJsonNode): PJsonObject; cdecl; external libjsonglib;
function json_node_dup_object(node: PJsonNode): PJsonObject; cdecl; external libjsonglib;
procedure json_node_set_array(node: PJsonNode; arr: PJsonArray); cdecl; external libjsonglib;
procedure json_node_take_array(node: PJsonNode; arr: PJsonArray); cdecl; external libjsonglib;
function json_node_get_array(node: PJsonNode): PJsonArray; cdecl; external libjsonglib;
function json_node_dup_array(node: PJsonNode): PJsonArray; cdecl; external libjsonglib;
procedure json_node_set_value(node: PJsonNode; value: PGValue); cdecl; external libjsonglib;
procedure json_node_get_value(node: PJsonNode; value: PGValue); cdecl; external libjsonglib;
procedure json_node_set_string(node: PJsonNode; value: Pgchar); cdecl; external libjsonglib;
function json_node_get_string(node: PJsonNode): Pgchar; cdecl; external libjsonglib;
function json_node_dup_string(node: PJsonNode): Pgchar; cdecl; external libjsonglib;
procedure json_node_set_int(node: PJsonNode; value: Tgint64); cdecl; external libjsonglib;
function json_node_get_int(node: PJsonNode): Tgint64; cdecl; external libjsonglib;
procedure json_node_set_double(node: PJsonNode; value: Tgdouble); cdecl; external libjsonglib;
function json_node_get_double(node: PJsonNode): Tgdouble; cdecl; external libjsonglib;
procedure json_node_set_boolean(node: PJsonNode; value: Tgboolean); cdecl; external libjsonglib;
function json_node_get_boolean(node: PJsonNode): Tgboolean; cdecl; external libjsonglib;
function json_node_is_null(node: PJsonNode): Tgboolean; cdecl; external libjsonglib;
procedure json_node_seal(node: PJsonNode); cdecl; external libjsonglib;
function json_node_is_immutable(node: PJsonNode): Tgboolean; cdecl; external libjsonglib;
function json_string_hash(key: Tgconstpointer): Tguint; cdecl; external libjsonglib;
function json_string_equal(a: Tgconstpointer; b: Tgconstpointer): Tgboolean; cdecl; external libjsonglib;
function json_string_compare(a: Tgconstpointer; b: Tgconstpointer): Tgint; cdecl; external libjsonglib;
function json_node_hash(key: Tgconstpointer): Tguint; cdecl; external libjsonglib;
function json_node_equal(a: Tgconstpointer; b: Tgconstpointer): Tgboolean; cdecl; external libjsonglib;
function json_object_get_type: TGType; cdecl; external libjsonglib;
function json_object_new: PJsonObject; cdecl; external libjsonglib;
function json_object_ref(obj: PJsonObject): PJsonObject; cdecl; external libjsonglib;
procedure json_object_unref(obj: PJsonObject); cdecl; external libjsonglib;
procedure json_object_add_member(obj: PJsonObject; member_name: Pgchar; node: PJsonNode); cdecl; external libjsonglib; deprecated;
procedure json_object_set_member(obj: PJsonObject; member_name: Pgchar; node: PJsonNode); cdecl; external libjsonglib;
procedure json_object_set_int_member(obj: PJsonObject; member_name: Pgchar; value: Tgint64); cdecl; external libjsonglib;
procedure json_object_set_double_member(obj: PJsonObject; member_name: Pgchar; value: Tgdouble); cdecl; external libjsonglib;
procedure json_object_set_boolean_member(obj: PJsonObject; member_name: Pgchar; value: Tgboolean); cdecl; external libjsonglib;
procedure json_object_set_string_member(obj: PJsonObject; member_name: Pgchar; value: Pgchar); cdecl; external libjsonglib;
procedure json_object_set_null_member(obj: PJsonObject; member_name: Pgchar); cdecl; external libjsonglib;
procedure json_object_set_array_member(obj: PJsonObject; member_name: Pgchar; value: PJsonArray); cdecl; external libjsonglib;
procedure json_object_set_object_member(obj: PJsonObject; member_name: Pgchar; value: PJsonObject); cdecl; external libjsonglib;
function json_object_get_members(obj: PJsonObject): PGList; cdecl; external libjsonglib;
function json_object_get_member(obj: PJsonObject; member_name: Pgchar): PJsonNode; cdecl; external libjsonglib;
function json_object_dup_member(obj: PJsonObject; member_name: Pgchar): PJsonNode; cdecl; external libjsonglib;
function json_object_get_int_member(obj: PJsonObject; member_name: Pgchar): Tgint64; cdecl; external libjsonglib;
function json_object_get_int_member_with_default(obj: PJsonObject; member_name: pchar; default_value: Tgint64): Tgint64; cdecl; external libjsonglib;
function json_object_get_double_member(obj: PJsonObject; member_name: Pgchar): Tgdouble; cdecl; external libjsonglib;
function json_object_get_double_member_with_default(obj: PJsonObject; member_name: pchar; default_value: Tdouble): Tdouble; cdecl; external libjsonglib;
function json_object_get_boolean_member(obj: PJsonObject; member_name: Pgchar): Tgboolean; cdecl; external libjsonglib;
function json_object_get_boolean_member_with_default(obj: PJsonObject; member_name: pchar; default_value: Tgboolean): Tgboolean; cdecl; external libjsonglib;
function json_object_get_string_member(obj: PJsonObject; member_name: Pgchar): Pgchar; cdecl; external libjsonglib;
function json_object_get_string_member_with_default(obj: PJsonObject; member_name: pchar; default_value: pchar): pchar; cdecl; external libjsonglib;
function json_object_get_null_member(obj: PJsonObject; member_name: Pgchar): Tgboolean; cdecl; external libjsonglib;
function json_object_get_array_member(obj: PJsonObject; member_name: Pgchar): PJsonArray; cdecl; external libjsonglib;
function json_object_get_object_member(obj: PJsonObject; member_name: Pgchar): PJsonObject; cdecl; external libjsonglib;
function json_object_has_member(obj: PJsonObject; member_name: Pgchar): Tgboolean; cdecl; external libjsonglib;
procedure json_object_remove_member(obj: PJsonObject; member_name: Pgchar); cdecl; external libjsonglib;
function json_object_get_values(obj: PJsonObject): PGList; cdecl; external libjsonglib;
function json_object_get_size(obj: PJsonObject): Tguint; cdecl; external libjsonglib;
procedure json_object_foreach_member(obj: PJsonObject; func: TJsonObjectForeach; data: Tgpointer); cdecl; external libjsonglib;
procedure json_object_seal(obj: PJsonObject); cdecl; external libjsonglib;
function json_object_is_immutable(obj: PJsonObject): Tgboolean; cdecl; external libjsonglib;
function json_object_hash(key: Tgconstpointer): Tguint; cdecl; external libjsonglib;
function json_object_equal(a: Tgconstpointer; b: Tgconstpointer): Tgboolean; cdecl; external libjsonglib;

type
  TJsonObjectIter = record
    priv_pointer: array[0..5] of Tgpointer;
    priv_int: array[0..1] of longint;
    priv_boolean: array[0..0] of Tgboolean;
  end;
  PJsonObjectIter = ^TJsonObjectIter;

procedure json_object_iter_init(iter: PJsonObjectIter; obj: PJsonObject); cdecl; external libjsonglib;
function json_object_iter_next(iter: PJsonObjectIter; member_name: PPgchar; member_node: PPJsonNode): Tgboolean; cdecl; external libjsonglib;
procedure json_object_iter_init_ordered(iter: PJsonObjectIter; obj: PJsonObject); cdecl; external libjsonglib;
function json_object_iter_next_ordered(iter: PJsonObjectIter; member_name: PPchar; member_node: PPJsonNode): Tgboolean; cdecl; external libjsonglib;
function json_array_get_type: TGType; cdecl; external libjsonglib;
function json_array_new: PJsonArray; cdecl; external libjsonglib;
function json_array_sized_new(n_elements: Tguint): PJsonArray; cdecl; external libjsonglib;
function json_array_ref(arr: PJsonArray): PJsonArray; cdecl; external libjsonglib;
procedure json_array_unref(arr: PJsonArray); cdecl; external libjsonglib;
procedure json_array_add_element(arr: PJsonArray; node: PJsonNode); cdecl; external libjsonglib;
procedure json_array_add_int_element(arr: PJsonArray; value: Tgint64); cdecl; external libjsonglib;
procedure json_array_add_double_element(arr: PJsonArray; value: Tgdouble); cdecl; external libjsonglib;
procedure json_array_add_boolean_element(arr: PJsonArray; value: Tgboolean); cdecl; external libjsonglib;
procedure json_array_add_string_element(arr: PJsonArray; value: Pgchar); cdecl; external libjsonglib;
procedure json_array_add_null_element(arr: PJsonArray); cdecl; external libjsonglib;
procedure json_array_add_array_element(arr: PJsonArray; value: PJsonArray); cdecl; external libjsonglib;
procedure json_array_add_object_element(arr: PJsonArray; value: PJsonObject); cdecl; external libjsonglib;
function json_array_get_elements(arr: PJsonArray): PGList; cdecl; external libjsonglib;
function json_array_get_element(arr: PJsonArray; index_: Tguint): PJsonNode; cdecl; external libjsonglib;
function json_array_get_int_element(arr: PJsonArray; index_: Tguint): Tgint64; cdecl; external libjsonglib;
function json_array_get_double_element(arr: PJsonArray; index_: Tguint): Tgdouble; cdecl; external libjsonglib;
function json_array_get_boolean_element(arr: PJsonArray; index_: Tguint): Tgboolean; cdecl; external libjsonglib;
function json_array_get_string_element(arr: PJsonArray; index_: Tguint): Pgchar; cdecl; external libjsonglib;
function json_array_get_null_element(arr: PJsonArray; index_: Tguint): Tgboolean; cdecl; external libjsonglib;
function json_array_get_array_element(arr: PJsonArray; index_: Tguint): PJsonArray; cdecl; external libjsonglib;
function json_array_get_object_element(arr: PJsonArray; index_: Tguint): PJsonObject; cdecl; external libjsonglib;
function json_array_dup_element(arr: PJsonArray; index_: Tguint): PJsonNode; cdecl; external libjsonglib;
procedure json_array_remove_element(arr: PJsonArray; index_: Tguint); cdecl; external libjsonglib;
function json_array_get_length(arr: PJsonArray): Tguint; cdecl; external libjsonglib;
procedure json_array_foreach_element(arr: PJsonArray; func: TJsonArrayForeach; data: Tgpointer); cdecl; external libjsonglib;
procedure json_array_seal(arr: PJsonArray); cdecl; external libjsonglib;
function json_array_is_immutable(arr: PJsonArray): Tgboolean; cdecl; external libjsonglib;
function json_array_hash(key: Tgconstpointer): Tguint; cdecl; external libjsonglib;
function json_array_equal(a: Tgconstpointer; b: Tgconstpointer): Tgboolean; cdecl; external libjsonglib;

function JSON_NODE_TYPE(node: PJsonNode): TJsonNodeType;
function JSON_NODE_HOLDS(node: PJsonNode; t: TJsonNodeType): boolean;
function JSON_NODE_HOLDS_VALUE(node: PJsonNode): boolean;
function JSON_NODE_HOLDS_OBJECT(node: PJsonNode): boolean;
function JSON_NODE_HOLDS_ARRAY(node: PJsonNode): boolean;
function JSON_NODE_HOLDS_NULL(node: PJsonNode): boolean;

function JSON_TYPE_NODE: TGType;
function JSON_TYPE_OBJECT: TGType;
function JSON_TYPE_ARRAY: TGType;

// === Konventiert am: 15-9-25 13:27:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function JSON_NODE_TYPE(node: PJsonNode): TJsonNodeType;
begin
  JSON_NODE_TYPE := json_node_get_node_type(node);
end;

function JSON_NODE_HOLDS(node: PJsonNode; t: TJsonNodeType): boolean;
begin
  JSON_NODE_HOLDS := json_node_get_node_type(node) = t;
end;

function JSON_NODE_HOLDS_VALUE(node: PJsonNode): boolean;
begin
  JSON_NODE_HOLDS_VALUE := JSON_NODE_HOLDS(node, JSON_NODE_VALUE);
end;

function JSON_NODE_HOLDS_OBJECT(node: PJsonNode): boolean;
begin
  JSON_NODE_HOLDS_OBJECT := JSON_NODE_HOLDS(node, JSON_NODE_OBJECT);
end;

function JSON_NODE_HOLDS_ARRAY(node: PJsonNode): boolean;
begin
  JSON_NODE_HOLDS_ARRAY := JSON_NODE_HOLDS(node, JSON_NODE_ARRAY);
end;

function JSON_NODE_HOLDS_NULL(node: PJsonNode): boolean;
begin
  JSON_NODE_HOLDS_NULL := JSON_NODE_HOLDS(node, JSON_NODE_NULL);
end;

function JSON_TYPE_NODE: TGType;
begin
  JSON_TYPE_NODE := json_node_get_type;
end;

function JSON_TYPE_OBJECT: TGType;
begin
  JSON_TYPE_OBJECT := json_object_get_type;
end;

function JSON_TYPE_ARRAY: TGType;
begin
  JSON_TYPE_ARRAY := json_array_get_type;
end;


{$ENDIF read_implementation}
