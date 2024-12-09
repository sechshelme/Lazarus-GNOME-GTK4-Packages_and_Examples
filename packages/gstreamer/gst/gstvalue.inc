
{$IFDEF read_interface}

const
  GST_FOURCC_FORMAT = 'c%c%c%c';

var
  _gst_int_range_type: TGType; cvar;external libgstreamer;
  _gst_int64_range_type: TGType; cvar;external libgstreamer;
  _gst_double_range_type: TGType; cvar;external libgstreamer;
  _gst_fraction_range_type: TGType; cvar;external libgstreamer;
  _gst_value_list_type: TGType; cvar;external libgstreamer;
  _gst_value_array_type: TGType; cvar;external libgstreamer;
  _gst_fraction_type: TGType; cvar;external libgstreamer;
  _gst_bitmask_type: TGType; cvar;external libgstreamer;
  _gst_flagset_type: TGType; cvar;external libgstreamer;

const
  GST_VALUE_LESS_THAN = -(1);
  GST_VALUE_EQUAL = 0;
  GST_VALUE_GREATER_THAN = 1;
  GST_VALUE_UNORDERED = 2;

type
  TGstValueCompareFunc = function(value1: PGValue; value2: PGValue): Tgint; cdecl;
  PGstValueSerializeFunc = ^TGstValueSerializeFunc;
  TGstValueSerializeFunc = function(value1: PGValue): Pgchar; cdecl;
  TGstValueDeserializeFunc = function(dest: PGValue; s: Pgchar): Tgboolean; cdecl;
  TGstValueDeserializeWithPSpecFunc = function(dest: PGValue; s: Pgchar; pspec: PGParamSpec): Tgboolean; cdecl;
  PGstValueTable = ^TGstValueTable;

  TGstValueTable = record
    _type: TGType;
    compare: TGstValueCompareFunc;
    serialize: TGstValueSerializeFunc;
    deserialize: TGstValueDeserializeFunc;
    deserialize_with_pspec: TGstValueDeserializeWithPSpecFunc;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;


function gst_int_range_get_type: TGType; cdecl; external libgstreamer;
function gst_int64_range_get_type: TGType; cdecl; external libgstreamer;
function gst_double_range_get_type: TGType; cdecl; external libgstreamer;
function gst_fraction_range_get_type: TGType; cdecl; external libgstreamer;
function gst_fraction_get_type: TGType; cdecl; external libgstreamer;
function gst_value_list_get_type: TGType; cdecl; external libgstreamer;
function gst_value_array_get_type: TGType; cdecl; external libgstreamer;
function gst_bitmask_get_type: TGType; cdecl; external libgstreamer;
function gst_flagset_get_type: TGType; cdecl; external libgstreamer;

function gst_g_thread_get_type: TGType; cdecl; external libgstreamer;

procedure gst_value_register(table: PGstValueTable); cdecl; external libgstreamer;
procedure gst_value_init_and_copy(dest: PGValue; src: PGValue); cdecl; external libgstreamer;
function gst_value_serialize(Value: PGValue): Pgchar; cdecl; external libgstreamer;
function gst_value_deserialize(dest: PGValue; src: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_value_deserialize_with_pspec(dest: PGValue; src: Pgchar; pspec: PGParamSpec): Tgboolean; cdecl; external libgstreamer;
procedure gst_value_list_append_value(Value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_append_and_take_value(Value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_prepend_value(Value: PGValue; prepend_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_concat(dest: PGValue; value1: PGValue; value2: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_merge(dest: PGValue; value1: PGValue; value2: PGValue); cdecl; external libgstreamer;
function gst_value_list_get_size(Value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_list_get_value(Value: PGValue; index: Tguint): PGValue; cdecl; external libgstreamer;
function gst_value_list_init(Value: PGValue; prealloc: Tguint): PGValue; cdecl; external libgstreamer;
procedure gst_value_array_append_value(Value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_array_append_and_take_value(Value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_array_prepend_value(Value: PGValue; prepend_value: PGValue); cdecl; external libgstreamer;
function gst_value_array_get_size(Value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_array_get_value(Value: PGValue; index: Tguint): PGValue; cdecl; external libgstreamer;
function gst_value_array_init(Value: PGValue; prealloc: Tguint): PGValue; cdecl; external libgstreamer;
procedure gst_value_set_int_range(Value: PGValue; start: Tgint; end_: Tgint); cdecl; external libgstreamer;
procedure gst_value_set_int_range_step(Value: PGValue; start: Tgint; end_: Tgint; step: Tgint); cdecl; external libgstreamer;
function gst_value_get_int_range_min(Value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_get_int_range_max(Value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_get_int_range_step(Value: PGValue): Tgint; cdecl; external libgstreamer;
procedure gst_value_set_int64_range(Value: PGValue; start: Tgint64; end_: Tgint64); cdecl; external libgstreamer;
procedure gst_value_set_int64_range_step(Value: PGValue; start: Tgint64; end_: Tgint64; step: Tgint64); cdecl; external libgstreamer;
function gst_value_get_int64_range_min(Value: PGValue): Tgint64; cdecl; external libgstreamer;
function gst_value_get_int64_range_max(Value: PGValue): Tgint64; cdecl; external libgstreamer;
function gst_value_get_int64_range_step(Value: PGValue): Tgint64; cdecl; external libgstreamer;
procedure gst_value_set_double_range(Value: PGValue; start: Tgdouble; end_: Tgdouble); cdecl; external libgstreamer;
function gst_value_get_double_range_min(Value: PGValue): Tgdouble; cdecl; external libgstreamer;
function gst_value_get_double_range_max(Value: PGValue): Tgdouble; cdecl; external libgstreamer;
function gst_value_get_caps(Value: PGValue): PGstCaps; cdecl; external libgstreamer;
procedure gst_value_set_caps(Value: PGValue; caps: PGstCaps); cdecl; external libgstreamer;
function gst_value_get_structure(Value: PGValue): PGstStructure; cdecl; external libgstreamer;
procedure gst_value_set_structure(Value: PGValue; structure: PGstStructure); cdecl; external libgstreamer;
function gst_value_get_caps_features(Value: PGValue): PGstCapsFeatures; cdecl; external libgstreamer;
procedure gst_value_set_caps_features(Value: PGValue; features: PGstCapsFeatures); cdecl; external libgstreamer;
procedure gst_value_set_fraction(Value: PGValue; numerator: Tgint; denominator: Tgint); cdecl; external libgstreamer;
function gst_value_get_fraction_numerator(Value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_get_fraction_denominator(Value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_fraction_multiply(product: PGValue; factor1: PGValue; factor2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_fraction_subtract(dest: PGValue; minuend: PGValue; subtrahend: PGValue): Tgboolean; cdecl; external libgstreamer;
procedure gst_value_set_fraction_range(Value: PGValue; start: PGValue; end_: PGValue); cdecl; external libgstreamer;
procedure gst_value_set_fraction_range_full(Value: PGValue; numerator_start: Tgint; denominator_start: Tgint; numerator_end: Tgint; denominator_end: Tgint); cdecl; external libgstreamer;
function gst_value_get_fraction_range_min(Value: PGValue): PGValue; cdecl; external libgstreamer;
function gst_value_get_fraction_range_max(Value: PGValue): PGValue; cdecl; external libgstreamer;
function gst_value_get_bitmask(Value: PGValue): Tguint64; cdecl; external libgstreamer;
procedure gst_value_set_bitmask(Value: PGValue; bitmask: Tguint64); cdecl; external libgstreamer;
procedure gst_value_set_flagset(Value: PGValue; flags: Tguint; mask: Tguint); cdecl; external libgstreamer;
function gst_value_get_flagset_flags(Value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_get_flagset_mask(Value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_compare(value1: PGValue; value2: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_can_compare(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_is_subset(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_union(dest: PGValue; value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_can_union(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_intersect(dest: PGValue; value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_can_intersect(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_subtract(dest: PGValue; minuend: PGValue; subtrahend: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_can_subtract(minuend: PGValue; subtrahend: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_is_fixed(Value: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_fixate(dest: PGValue; src: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_flagset_register(flags_type: TGType): TGType; cdecl; external libgstreamer;

function GST_TYPE_INT_RANGE: TGType;
function GST_TYPE_INT64_RANGE: TGType;
function GST_TYPE_DOUBLE_RANGE: TGType;
function GST_TYPE_FRACTION_RANGE: TGType;
function GST_TYPE_LIST: TGType;
function GST_TYPE_ARRAY: TGType;
function GST_TYPE_FRACTION: TGType;
function GST_TYPE_BITMASK: TGType;
function GST_TYPE_FLAG_SET: TGType;

function GST_MAKE_FOURCC(a, b, c, d: byte): Tguint32;
function GST_VALUE_HOLDS_INT_RANGE(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_INT64_RANGE(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_DOUBLE_RANGE(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_FRACTION_RANGE(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_LIST(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_ARRAY(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_CAPS(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_STRUCTURE(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_CAPS_FEATURES(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_BUFFER(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_SAMPLE(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_FRACTION(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_DATE_TIME(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_BITMASK(x: Pointer): Tgboolean;
function GST_VALUE_HOLDS_FLAG_SET(x: Pointer): Tgboolean;
function GST_FLAG_SET_MASK_EXACT: Tguint;

function GST_TYPE_G_THREAD: TGType;

// === Konventiert am: 16-9-24 16:57:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_INT_RANGE: TGType;
begin
  Result := _gst_int_range_type;
end;

function GST_TYPE_INT64_RANGE: TGType;
begin
  Result := _gst_int64_range_type;
end;

function GST_TYPE_DOUBLE_RANGE: TGType;
begin
  Result := _gst_double_range_type;
end;

function GST_TYPE_FRACTION_RANGE: TGType;
begin
  Result := _gst_fraction_range_type;
end;

function GST_TYPE_LIST: TGType;
begin
  Result := _gst_value_list_type;
end;

function GST_TYPE_ARRAY: TGType;
begin
  Result := _gst_value_array_type;
end;

function GST_TYPE_FRACTION: TGType;
begin
  Result := _gst_fraction_type;
end;

function GST_TYPE_BITMASK: TGType;
begin
  Result := _gst_bitmask_type;
end;

function GST_TYPE_FLAG_SET: TGType;
begin
  Result := _gst_flagset_type;
end;

function GST_MAKE_FOURCC(a, b, c, d: byte): Tguint32;
begin
  GST_MAKE_FOURCC := (((Tguint32(a)) or ((Tguint32(b)) shl 8)) or ((Tguint32(c)) shl 16)) or ((Tguint32(d)) shl 24);
end;

function GST_VALUE_HOLDS_INT_RANGE(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_int_range_type);
end;

function GST_VALUE_HOLDS_INT64_RANGE(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_int64_range_type);
end;

function GST_VALUE_HOLDS_DOUBLE_RANGE(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_double_range_type);
end;

function GST_VALUE_HOLDS_FRACTION_RANGE(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_fraction_range_type);
end;

function GST_VALUE_HOLDS_LIST(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_value_list_type);
end;

function GST_VALUE_HOLDS_ARRAY(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_value_array_type);
end;

function GST_VALUE_HOLDS_CAPS(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_caps_type);
end;

function GST_VALUE_HOLDS_STRUCTURE(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_structure_type);
end;

function GST_VALUE_HOLDS_CAPS_FEATURES(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_caps_features_type);
end;

function GST_VALUE_HOLDS_BUFFER(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_buffer_type);
end;

function GST_VALUE_HOLDS_SAMPLE(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_int_range_type);
end;

function GST_VALUE_HOLDS_FRACTION(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_fraction_type);
end;

function GST_VALUE_HOLDS_DATE_TIME(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_date_time_type);
end;

function GST_VALUE_HOLDS_BITMASK(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = _gst_bitmask_type);
end;

function GST_VALUE_HOLDS_FLAG_SET(x: Pointer): Tgboolean;
begin
  Result := (Tgpointer(x) <> nil) and (G_VALUE_TYPE(x) = GST_TYPE_FLAG_SET);
  GST_VALUE_HOLDS_FLAG_SET := (G_TYPE_FUNDAMENTAL(G_VALUE_TYPE(x))) = GST_TYPE_FLAG_SET;
end;

function GST_FLAG_SET_MASK_EXACT: Tguint;
begin
  GST_FLAG_SET_MASK_EXACT := Tguint(-1);
end;

function GST_TYPE_G_THREAD: TGType;
begin
  GST_TYPE_G_THREAD := gst_g_thread_get_type;
end;


{$ENDIF read_implementation}
