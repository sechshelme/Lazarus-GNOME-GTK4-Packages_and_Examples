unit gstcaps;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstminiobject, gstidstr, gstcapsfeatures, gststructure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstCapsFlags = ^TGstCapsFlags;
  TGstCapsFlags = longint;
const
  GST_CAPS_FLAG_ANY = GST_MINI_OBJECT_FLAG_LAST shl 0;

type
  PGstCapsIntersectMode = ^TGstCapsIntersectMode;
  TGstCapsIntersectMode = longint;
const
  GST_CAPS_INTERSECT_ZIG_ZAG = 0;
  GST_CAPS_INTERSECT_FIRST = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstCaps = ^TGstCaps;
  TGstCaps = record
    mini_object: TGstMiniObject;
  end;

  PGstStaticCaps = ^TGstStaticCaps;
  TGstStaticCaps = record
    caps: PGstCaps;
    _string: pchar;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstCapsForeachFunc = function(features: PGstCapsFeatures; structure: PGstStructure; user_data: Tgpointer): Tgboolean; cdecl;
  TGstCapsMapFunc = function(features: PGstCapsFeatures; structure: PGstStructure; user_data: Tgpointer): Tgboolean; cdecl;
  TGstCapsFilterMapFunc = function(features: PGstCapsFeatures; structure: PGstStructure; user_data: Tgpointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_caps_type: TGType; cvar;external libgstreamer;
  _gst_caps_any: PGstCaps; cvar;external libgstreamer;
  _gst_caps_none: PGstCaps; cvar;external libgstreamer;

function gst_caps_ref(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;
procedure gst_caps_unref(caps: PGstCaps); cdecl; external libgstreamer;
procedure gst_clear_caps(caps_ptr: PPGstCaps); cdecl; external libgstreamer;
function gst_caps_copy(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_replace(old_caps: PPGstCaps; new_caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_make_writable(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_is_writable(caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_take(old_caps: PPGstCaps; new_caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_steal(old_caps: PPGstCaps): PGstCaps; cdecl; external libgstreamer;


function gst_caps_get_type: TGType; cdecl; external libgstreamer;
function gst_caps_new_empty: PGstCaps; cdecl; external libgstreamer;
function gst_caps_new_any: PGstCaps; cdecl; external libgstreamer;
function gst_caps_new_id_str_empty_simple(media_type: PGstIdStr): PGstCaps; cdecl; external libgstreamer;
function gst_caps_new_empty_simple(media_type: pchar): PGstCaps; cdecl; external libgstreamer;
function gst_caps_new_static_str_empty_simple(media_type: pchar): PGstCaps; cdecl; external libgstreamer;
function gst_caps_new_id_str_simple(media_type: PGstIdStr; fieldname: PGstIdStr): PGstCaps; cdecl; varargs; external libgstreamer;
function gst_caps_new_simple(media_type: pchar; fieldname: pchar): PGstCaps; cdecl; varargs; external libgstreamer;
function gst_caps_new_static_str_simple(media_type: pchar; fieldname: pchar): PGstCaps; cdecl; varargs; external libgstreamer;
function gst_caps_new_full(struct1: PGstStructure): PGstCaps; cdecl; varargs; external libgstreamer;
function gst_caps_new_full_valist(structure: PGstStructure; var_args: Tva_list): PGstCaps; cdecl; external libgstreamer;

function gst_static_caps_get_type: TGType; cdecl; external libgstreamer;
function gst_static_caps_get(static_caps: PGstStaticCaps): PGstCaps; cdecl; external libgstreamer;
procedure gst_static_caps_cleanup(static_caps: PGstStaticCaps); cdecl; external libgstreamer;

procedure gst_caps_append(caps1: PGstCaps; caps2: PGstCaps); cdecl; external libgstreamer;
procedure gst_caps_append_structure(caps: PGstCaps; structure: PGstStructure); cdecl; external libgstreamer;
procedure gst_caps_append_structure_full(caps: PGstCaps; structure: PGstStructure; features: PGstCapsFeatures); cdecl; external libgstreamer;
procedure gst_caps_remove_structure(caps: PGstCaps; idx: Tguint); cdecl; external libgstreamer;
function gst_caps_merge(caps1: PGstCaps; caps2: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_merge_structure(caps: PGstCaps; structure: PGstStructure): PGstCaps; cdecl; external libgstreamer;
function gst_caps_merge_structure_full(caps: PGstCaps; structure: PGstStructure; features: PGstCapsFeatures): PGstCaps; cdecl; external libgstreamer;
function gst_caps_get_size(caps: PGstCaps): Tguint; cdecl; external libgstreamer;
function gst_caps_get_structure(caps: PGstCaps; index: Tguint): PGstStructure; cdecl; external libgstreamer;
function gst_caps_steal_structure(caps: PGstCaps; index: Tguint): PGstStructure; cdecl; external libgstreamer;
procedure gst_caps_set_features(caps: PGstCaps; index: Tguint; features: PGstCapsFeatures); cdecl; external libgstreamer;
procedure gst_caps_set_features_simple(caps: PGstCaps; features: PGstCapsFeatures); cdecl; external libgstreamer;
function gst_caps_get_features(caps: PGstCaps; index: Tguint): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_copy_nth(caps: PGstCaps; nth: Tguint): PGstCaps; cdecl; external libgstreamer;
function gst_caps_truncate(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;
procedure gst_caps_id_str_set_value(caps: PGstCaps; field: PGstIdStr; value: PGValue); cdecl; external libgstreamer;
procedure gst_caps_set_value(caps: PGstCaps; field: pchar; value: PGValue); cdecl; external libgstreamer;
procedure gst_caps_set_value_static_str(caps: PGstCaps; field: pchar; value: PGValue); cdecl; external libgstreamer;
procedure gst_caps_id_str_set_simple(caps: PGstCaps; field: PGstIdStr); cdecl; varargs; external libgstreamer;
procedure gst_caps_set_simple(caps: PGstCaps; field: pchar); cdecl; varargs; external libgstreamer;
procedure gst_caps_set_simple_static_str(caps: PGstCaps; field: pchar); cdecl; varargs; external libgstreamer;
procedure gst_caps_id_str_set_simple_valist(caps: PGstCaps; field: PGstIdStr; varargs: Tva_list); cdecl; external libgstreamer;
procedure gst_caps_set_simple_valist(caps: PGstCaps; field: pchar; varargs: Tva_list); cdecl; external libgstreamer;
procedure gst_caps_set_simple_static_str_valist(caps: PGstCaps; field: pchar; varargs: Tva_list); cdecl; external libgstreamer;
function gst_caps_foreach(caps: PGstCaps; func: TGstCapsForeachFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_caps_map_in_place(caps: PGstCaps; func: TGstCapsMapFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
procedure gst_caps_filter_and_map_in_place(caps: PGstCaps; func: TGstCapsFilterMapFunc; user_data: Tgpointer); cdecl; external libgstreamer;

function gst_caps_is_any(caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_empty(caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_fixed(caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_always_compatible(caps1: PGstCaps; caps2: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_subset(subset: PGstCaps; superset: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_subset_structure(caps: PGstCaps; structure: PGstStructure): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_subset_structure_full(caps: PGstCaps; structure: PGstStructure; features: PGstCapsFeatures): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_equal(caps1: PGstCaps; caps2: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_equal_fixed(caps1: PGstCaps; caps2: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_can_intersect(caps1: PGstCaps; caps2: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_caps_is_strictly_equal(caps1: PGstCaps; caps2: PGstCaps): Tgboolean; cdecl; external libgstreamer;

function gst_caps_intersect(caps1: PGstCaps; caps2: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_intersect_full(caps1: PGstCaps; caps2: PGstCaps; mode: TGstCapsIntersectMode): PGstCaps; cdecl; external libgstreamer;
function gst_caps_subtract(minuend: PGstCaps; subtrahend: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_normalize(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_simplify(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_caps_fixate(caps: PGstCaps): PGstCaps; cdecl; external libgstreamer;

function gst_caps_to_string(caps: PGstCaps): Pgchar; cdecl; external libgstreamer;
function gst_caps_serialize(caps: PGstCaps; flags: TGstSerializeFlags): Pgchar; cdecl; external libgstreamer;
function gst_caps_from_string(_string: Pgchar): PGstCaps; cdecl; external libgstreamer;


function GST_TYPE_CAPS: TGType;
function GST_CAPS_ANY: PGstCaps;
function GST_CAPS_NONE: PGstCaps;

function GST_IS_CAPS(obj: Pointer): Tgboolean;
function GST_CAPS_CAST(obj: Pointer): PGstCaps;
function GST_CAPS(obj: Pointer): PGstCaps;
function GST_TYPE_STATIC_CAPS: TGType;

function GST_STATIC_CAPS_ANY: TGstStaticCaps;
function GST_STATIC_CAPS_NONE: TGstStaticCaps;
function GST_CAPS_IS_SIMPLE(caps: PGstCaps): Tgboolean;
function GST_CAPS_FLAGS(caps: PGstCaps): Tguint;
function GST_CAPS_REFCOUNT(caps: PGstCaps): Tgint;
function GST_CAPS_REFCOUNT_VALUE(caps: PGstCaps): Tgint;
function GST_CAPS_FLAG_IS_SET(caps: Pointer; flag: Tguint32): Tgboolean;
procedure GST_CAPS_FLAG_SET(var caps: Pointer; flag: Tguint32);
procedure GST_CAPS_FLAG_UNSET(var caps: Pointer; flag: Tguint32);

{$ENDIF read_function}

// === Konventiert am: 10-7-26 19:46:15 ===


implementation

function GST_TYPE_CAPS: TGType;
begin
  Result := _gst_caps_type;
end;

function GST_CAPS_ANY: PGstCaps;
begin
  Result := _gst_caps_any;
end;

function GST_CAPS_NONE: PGstCaps;
begin
  Result := _gst_caps_none;
end;


function GST_IS_CAPS(obj: Pointer): Tgboolean;
begin
  GST_IS_CAPS := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_CAPS);
end;

function GST_CAPS_CAST(obj: Pointer): PGstCaps;
begin
  GST_CAPS_CAST := PGstCaps(obj);
end;

function GST_CAPS(obj: Pointer): PGstCaps;
begin
  GST_CAPS := GST_CAPS_CAST(obj);
end;

function GST_TYPE_STATIC_CAPS: TGType;
begin
  GST_TYPE_STATIC_CAPS := gst_static_caps_get_type;
end;

function GST_STATIC_CAPS_ANY: TGstStaticCaps;
begin
  Result.caps := nil;
  Result._string := 'ANY';
  Result._gst_reserved[0] := nil;
  Result._gst_reserved[1] := nil;
  Result._gst_reserved[2] := nil;
  Result._gst_reserved[3] := nil;
end;

function GST_STATIC_CAPS_NONE: TGstStaticCaps;
begin
  Result.caps := nil;
  Result._string := 'NONE';
  Result._gst_reserved[0] := nil;
  Result._gst_reserved[1] := nil;
  Result._gst_reserved[2] := nil;
  Result._gst_reserved[3] := nil;
end;

function GST_CAPS_IS_SIMPLE(caps: PGstCaps): Tgboolean;
begin
  GST_CAPS_IS_SIMPLE := (gst_caps_get_size(caps)) = 1;
end;

function GST_CAPS_FLAGS(caps: PGstCaps): Tguint;
begin
  GST_CAPS_FLAGS := GST_MINI_OBJECT_FLAGS(caps);
end;

function GST_CAPS_REFCOUNT(caps: PGstCaps): Tgint;
begin
  GST_CAPS_REFCOUNT := GST_MINI_OBJECT_REFCOUNT(caps);
end;

function GST_CAPS_REFCOUNT_VALUE(caps: PGstCaps): Tgint;
begin
  GST_CAPS_REFCOUNT_VALUE := GST_MINI_OBJECT_REFCOUNT_VALUE(caps);
end;

function GST_CAPS_FLAG_IS_SET(caps: Pointer; flag: Tguint32): Tgboolean;
begin
  GST_CAPS_FLAG_IS_SET := GST_MINI_OBJECT_FLAG_IS_SET(caps, flag);
end;

procedure GST_CAPS_FLAG_SET(var caps: Pointer; flag: Tguint32);
begin
  GST_MINI_OBJECT_FLAG_SET(caps, flag);
end;

procedure GST_CAPS_FLAG_UNSET(var caps: Pointer; flag: Tguint32);
begin
  GST_MINI_OBJECT_FLAG_UNSET(caps, flag);
end;

end.
