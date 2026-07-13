

  {$IFDEF read_enum}
const
  GST_VALUE_LESS_THAN = -(1);
  GST_VALUE_EQUAL = 0;
  GST_VALUE_GREATER_THAN = 1;
  GST_VALUE_UNORDERED = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGstValueCompareFunc = function(value1: PGValue; value2: PGValue): Tgint; cdecl;
  TGstValueSerializeFunc = function(value1: PGValue): Pgchar; cdecl;
  TGstValueDeserializeFunc = function(dest: PGValue; s: Pgchar): Tgboolean; cdecl;
  TGstValueDeserializeWithPSpecFunc = function(dest: PGValue; s: Pgchar; pspec: PGParamSpec): Tgboolean; cdecl;
  TGstValueHashFunc = function(value: PGValue; res: Pguint): Tgboolean; cdecl;

  PGstValueTable = ^TGstValueTable;
  TGstValueTable = record
    _type: TGType;
    compare: TGstValueCompareFunc;
    serialize: TGstValueSerializeFunc;
    deserialize: TGstValueDeserializeFunc;
    deserialize_with_pspec: TGstValueDeserializeWithPSpecFunc;
    hash: TGstValueHashFunc;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_int_range_type: TGType; cvar;external libgstreamer;
  _gst_int64_range_type: TGType; cvar;external libgstreamer;
  _gst_double_range_type: TGType; cvar;external libgstreamer;
  _gst_fraction_range_type: TGType; cvar;external libgstreamer;
  _gst_value_list_type: TGType; cvar;external libgstreamer;
  _gst_value_unique_list_type: TGType; cvar;external libgstreamer;
  _gst_value_array_type: TGType; cvar;external libgstreamer;
  _gst_fraction_type: TGType; cvar;external libgstreamer;
  _gst_bitmask_type: TGType; cvar;external libgstreamer;
  _gst_flagset_type: TGType; cvar;external libgstreamer;

function gst_int_range_get_type: TGType; cdecl; external libgstreamer;
function gst_int64_range_get_type: TGType; cdecl; external libgstreamer;
function gst_double_range_get_type: TGType; cdecl; external libgstreamer;
function gst_fraction_range_get_type: TGType; cdecl; external libgstreamer;
function gst_fraction_get_type: TGType; cdecl; external libgstreamer;
function gst_value_list_get_type: TGType; cdecl; external libgstreamer;
function gst_value_array_get_type: TGType; cdecl; external libgstreamer;
function gst_value_unique_list_get_type: TGType; cdecl; external libgstreamer;
function gst_bitmask_get_type: TGType; cdecl; external libgstreamer;
function gst_flagset_get_type: TGType; cdecl; external libgstreamer;

function gst_g_thread_get_type: TGType; cdecl; external libgstreamer;

procedure gst_value_register(table: PGstValueTable); cdecl; external libgstreamer;
procedure gst_value_init_and_copy(dest: PGValue; src: PGValue); cdecl; external libgstreamer;
function gst_value_serialize(value: PGValue): Pgchar; cdecl; external libgstreamer;
function gst_value_deserialize(dest: PGValue; src: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_value_deserialize_with_pspec(dest: PGValue; src: Pgchar; pspec: PGParamSpec): Tgboolean; cdecl; external libgstreamer;
function gst_value_hash(value: PGValue; res: Pguint): Tgboolean; cdecl; external libgstreamer;

procedure gst_value_list_append_value(value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_append_and_take_value(value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_prepend_value(value: PGValue; prepend_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_concat(dest: PGValue; value1: PGValue; value2: PGValue); cdecl; external libgstreamer;
procedure gst_value_list_merge(dest: PGValue; value1: PGValue; value2: PGValue); cdecl; external libgstreamer;
function gst_value_list_get_size(value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_list_get_value(value: PGValue; index: Tguint): PGValue; cdecl; external libgstreamer;
function gst_value_list_init(value: PGValue; prealloc: Tguint): PGValue; cdecl; external libgstreamer;

procedure gst_value_array_append_value(value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_array_append_and_take_value(value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_array_prepend_value(value: PGValue; prepend_value: PGValue); cdecl; external libgstreamer;
function gst_value_array_get_size(value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_array_get_value(value: PGValue; index: Tguint): PGValue; cdecl; external libgstreamer;
function gst_value_array_init(value: PGValue; prealloc: Tguint): PGValue; cdecl; external libgstreamer;

procedure gst_value_unique_list_append_value(value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_unique_list_append_and_take_value(value: PGValue; append_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_unique_list_prepend_value(value: PGValue; prepend_value: PGValue); cdecl; external libgstreamer;
procedure gst_value_unique_list_concat(dest: PGValue; value1: PGValue; value2: PGValue); cdecl; external libgstreamer;
function gst_value_unique_list_get_size(value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_unique_list_get_value(value: PGValue; index: Tguint): PGValue; cdecl; external libgstreamer;

procedure gst_value_set_int_range(value: PGValue; start: Tgint; end_: Tgint); cdecl; external libgstreamer;
procedure gst_value_set_int_range_step(value: PGValue; start: Tgint; end_: Tgint; step: Tgint); cdecl; external libgstreamer;
function gst_value_get_int_range_min(value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_get_int_range_max(value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_get_int_range_step(value: PGValue): Tgint; cdecl; external libgstreamer;

procedure gst_value_set_int64_range(value: PGValue; start: Tgint64; end_: Tgint64); cdecl; external libgstreamer;
procedure gst_value_set_int64_range_step(value: PGValue; start: Tgint64; end_: Tgint64; step: Tgint64); cdecl; external libgstreamer;
function gst_value_get_int64_range_min(value: PGValue): Tgint64; cdecl; external libgstreamer;
function gst_value_get_int64_range_max(value: PGValue): Tgint64; cdecl; external libgstreamer;
function gst_value_get_int64_range_step(value: PGValue): Tgint64; cdecl; external libgstreamer;

procedure gst_value_set_double_range(value: PGValue; start: Tgdouble; end_: Tgdouble); cdecl; external libgstreamer;
function gst_value_get_double_range_min(value: PGValue): Tgdouble; cdecl; external libgstreamer;
function gst_value_get_double_range_max(value: PGValue): Tgdouble; cdecl; external libgstreamer;

function gst_value_get_caps(value: PGValue): PGstCaps; cdecl; external libgstreamer;
procedure gst_value_set_caps(value: PGValue; caps: PGstCaps); cdecl; external libgstreamer;

function gst_value_get_structure(value: PGValue): PGstStructure; cdecl; external libgstreamer;
procedure gst_value_set_structure(value: PGValue; structure: PGstStructure); cdecl; external libgstreamer;

function gst_value_get_caps_features(value: PGValue): PGstCapsFeatures; cdecl; external libgstreamer;
procedure gst_value_set_caps_features(value: PGValue; features: PGstCapsFeatures); cdecl; external libgstreamer;

procedure gst_value_set_fraction(value: PGValue; numerator: Tgint; denominator: Tgint); cdecl; external libgstreamer;
function gst_value_get_fraction_numerator(value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_get_fraction_denominator(value: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_fraction_multiply(product: PGValue; factor1: PGValue; factor2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_fraction_subtract(dest: PGValue; minuend: PGValue; subtrahend: PGValue): Tgboolean; cdecl; external libgstreamer;

procedure gst_value_set_fraction_range(value: PGValue; start: PGValue; end_: PGValue); cdecl; external libgstreamer;
procedure gst_value_set_fraction_range_full(value: PGValue; numerator_start: Tgint; denominator_start: Tgint; numerator_end: Tgint; denominator_end: Tgint); cdecl; external libgstreamer;
function gst_value_get_fraction_range_min(value: PGValue): PGValue; cdecl; external libgstreamer;
function gst_value_get_fraction_range_max(value: PGValue): PGValue; cdecl; external libgstreamer;

function gst_value_get_bitmask(value: PGValue): Tguint64; cdecl; external libgstreamer;
procedure gst_value_set_bitmask(value: PGValue; bitmask: Tguint64); cdecl; external libgstreamer;

procedure gst_value_set_flagset(value: PGValue; flags: Tguint; mask: Tguint); cdecl; external libgstreamer;
function gst_value_get_flagset_flags(value: PGValue): Tguint; cdecl; external libgstreamer;
function gst_value_get_flagset_mask(value: PGValue): Tguint; cdecl; external libgstreamer;

function gst_value_compare(value1: PGValue; value2: PGValue): Tgint; cdecl; external libgstreamer;
function gst_value_can_compare(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_is_subset(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;

function gst_value_union(dest: PGValue; value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_can_union(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;

function gst_value_intersect(dest: PGValue; value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_can_intersect(value1: PGValue; value2: PGValue): Tgboolean; cdecl; external libgstreamer;

function gst_value_subtract(dest: PGValue; minuend: PGValue; subtrahend: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_can_subtract(minuend: PGValue; subtrahend: PGValue): Tgboolean; cdecl; external libgstreamer;

function gst_value_is_fixed(value: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_value_fixate(dest: PGValue; src: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_flagset_register(flags_type: TGType): TGType; cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 15:53:56 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
