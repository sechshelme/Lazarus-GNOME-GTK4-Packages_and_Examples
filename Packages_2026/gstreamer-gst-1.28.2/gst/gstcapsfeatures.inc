


  {$IFDEF read_enum}
const
  GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY = 'memory:SystemMemory';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstCapsFeatures = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_caps_features_any: PGstCapsFeatures; cvar;external libgstreamer;
  _gst_caps_features_memory_system_memory: PGstCapsFeatures; cvar;external libgstreamer;
  _gst_caps_features_type: TGType; cvar;external libgstreamer;

function gst_caps_features_get_type: TGType; cdecl; external libgstreamer;
function gst_is_caps_features(obj: Tgconstpointer): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_new_empty: PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_any: PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_single(feature: Pgchar): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_single_static_str(feature: Pgchar): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new(feature1: Pgchar): PGstCapsFeatures; cdecl; varargs; external libgstreamer;
function gst_caps_features_new_static_str(feature1: Pgchar): PGstCapsFeatures; cdecl; varargs; external libgstreamer;
function gst_caps_features_new_valist(feature1: Pgchar; varargs: Tva_list): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_static_str_valist(feature1: Pgchar; varargs: Tva_list): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_id(feature1: TGQuark): PGstCapsFeatures; cdecl; varargs; external libgstreamer; deprecated;
function gst_caps_features_new_id_valist(feature1: TGQuark; varargs: Tva_list): PGstCapsFeatures; cdecl; external libgstreamer; deprecated;
function gst_caps_features_new_id_str(feature1: PGstIdStr): PGstCapsFeatures; cdecl; varargs; external libgstreamer;
function gst_caps_features_new_id_str_valist(feature1: PGstIdStr; varargs: Tva_list): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_set_parent_refcount(features: PGstCapsFeatures; refcount: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_copy(features: PGstCapsFeatures): PGstCapsFeatures; cdecl; external libgstreamer;
procedure gst_caps_features_free(features: PGstCapsFeatures); cdecl; external libgstreamer;
function gst_caps_features_to_string(features: PGstCapsFeatures): Pgchar; cdecl; external libgstreamer;
function gst_caps_features_from_string(features: Pgchar): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_get_size(features: PGstCapsFeatures): Tguint; cdecl; external libgstreamer;
function gst_caps_features_get_nth(features: PGstCapsFeatures; i: Tguint): Pgchar; cdecl; external libgstreamer;
function gst_caps_features_get_nth_id(features: PGstCapsFeatures; i: Tguint): TGQuark; cdecl; external libgstreamer; deprecated;
function gst_caps_features_get_nth_id_str(features: PGstCapsFeatures; i: Tguint): PGstIdStr; cdecl; external libgstreamer;
function gst_caps_features_contains(features: PGstCapsFeatures; feature: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_contains_id(features: PGstCapsFeatures; feature: TGQuark): Tgboolean; cdecl; external libgstreamer; deprecated;
function gst_caps_features_contains_id_str(features: PGstCapsFeatures; feature: PGstIdStr): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_is_equal(features1: PGstCapsFeatures; features2: PGstCapsFeatures): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_is_any(features: PGstCapsFeatures): Tgboolean; cdecl; external libgstreamer;
procedure gst_caps_features_add(features: PGstCapsFeatures; feature: Pgchar); cdecl; external libgstreamer;
procedure gst_caps_features_add_static_str(features: PGstCapsFeatures; feature: Pgchar); cdecl; external libgstreamer;
procedure gst_caps_features_add_id(features: PGstCapsFeatures; feature: TGQuark); cdecl; external libgstreamer; deprecated;
procedure gst_caps_features_add_id_str(features: PGstCapsFeatures; feature: PGstIdStr); cdecl; external libgstreamer;
procedure gst_caps_features_remove(features: PGstCapsFeatures; feature: Pgchar); cdecl; external libgstreamer;
procedure gst_caps_features_remove_id(features: PGstCapsFeatures; feature: TGQuark); cdecl; external libgstreamer; deprecated;
procedure gst_caps_features_remove_id_str(features: PGstCapsFeatures; feature: PGstIdStr); cdecl; external libgstreamer;


function GST_TYPE_CAPS_FEATURES: TGType;
function GST_CAPS_FEATURES_ANY: PGstCapsFeatures;
function GST_CAPS_FEATURES_MEMORY_SYSTEM_MEMORY: PGstCapsFeatures;

function GST_CAPS_FEATURES_CAST(obj: Pointer): PGstCapsFeatures;
function GST_CAPS_FEATURES(obj: Pointer): PGstCapsFeatures;
{$ENDIF read_function}

// === Konventiert am: 10-7-26 19:57:04 ===



{$IFDEF read_implementation}

function GST_TYPE_CAPS_FEATURES: TGType;
begin
  Result := _gst_caps_features_type;
end;

function GST_CAPS_FEATURES_ANY: PGstCapsFeatures;
begin
  Result := _gst_caps_features_any;
end;

function GST_CAPS_FEATURES_MEMORY_SYSTEM_MEMORY: PGstCapsFeatures;
begin
  Result := _gst_caps_features_memory_system_memory;
end;

function GST_CAPS_FEATURES_CAST(obj: Pointer): PGstCapsFeatures;
begin
  GST_CAPS_FEATURES_CAST := PGstCapsFeatures(obj);
end;

function GST_CAPS_FEATURES(obj: Pointer): PGstCapsFeatures;
begin
  GST_CAPS_FEATURES := GST_CAPS_FEATURES_CAST(obj);
end;

{$ENDIF read_implementation}
