/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGstCapsFeatures = record
  end;
  PGstCapsFeatures = ^TGstCapsFeatures;

const
  GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY = 'memory:SystemMemory';

var
  _gst_caps_features_type: TGType; cvar;external libgstreamer;
  _gst_caps_features_any: PGstCapsFeatures; cvar;external libgstreamer;
  _gst_caps_features_memory_system_memory: PGstCapsFeatures; cvar;external libgstreamer;


function gst_caps_features_get_type: TGType; cdecl; external libgstreamer;
function gst_is_caps_features(obj: Tgconstpointer): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_new_empty: PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_any: PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_single(feature: Pgchar): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new(feature1: Pgchar): PGstCapsFeatures; varargs cdecl; external libgstreamer;
function gst_caps_features_new_valist(feature1: Pgchar; varargs: Tva_list): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_new_id(feature1: TGQuark): PGstCapsFeatures; varargs cdecl; external libgstreamer;
function gst_caps_features_new_id_valist(feature1: TGQuark; varargs: Tva_list): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_set_parent_refcount(features: PGstCapsFeatures; refcount: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_copy(features: PGstCapsFeatures): PGstCapsFeatures; cdecl; external libgstreamer;
procedure gst_caps_features_free(features: PGstCapsFeatures); cdecl; external libgstreamer;
function gst_caps_features_to_string(features: PGstCapsFeatures): Pgchar; cdecl; external libgstreamer;
function gst_caps_features_from_string(features: Pgchar): PGstCapsFeatures; cdecl; external libgstreamer;
function gst_caps_features_get_size(features: PGstCapsFeatures): Tguint; cdecl; external libgstreamer;
function gst_caps_features_get_nth(features: PGstCapsFeatures; i: Tguint): Pgchar; cdecl; external libgstreamer;
function gst_caps_features_get_nth_id(features: PGstCapsFeatures; i: Tguint): TGQuark; cdecl; external libgstreamer;
function gst_caps_features_contains(features: PGstCapsFeatures; feature: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_contains_id(features: PGstCapsFeatures; feature: TGQuark): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_is_equal(features1: PGstCapsFeatures; features2: PGstCapsFeatures): Tgboolean; cdecl; external libgstreamer;
function gst_caps_features_is_any(features: PGstCapsFeatures): Tgboolean; cdecl; external libgstreamer;
procedure gst_caps_features_add(features: PGstCapsFeatures; feature: Pgchar); cdecl; external libgstreamer;
procedure gst_caps_features_add_id(features: PGstCapsFeatures; feature: TGQuark); cdecl; external libgstreamer;
procedure gst_caps_features_remove(features: PGstCapsFeatures; feature: Pgchar); cdecl; external libgstreamer;
procedure gst_caps_features_remove_id(features: PGstCapsFeatures; feature: TGQuark); cdecl; external libgstreamer;

function GST_TYPE_CAPS_FEATURES: TGType;
function GST_CAPS_FEATURES_ANY: PGstCapsFeatures;
function GST_CAPS_FEATURES_MEMORY_SYSTEM_MEMORY: PGstCapsFeatures;

function GST_CAPS_FEATURES_CAST(obj: Pointer): PGstCapsFeatures;
function GST_CAPS_FEATURES(obj: Pointer): PGstCapsFeatures;


// === Konventiert am: 13-9-24 17:20:19 ===


{$ENDIF read_interface}


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
