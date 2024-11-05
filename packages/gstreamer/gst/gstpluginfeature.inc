/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstRank = ^TGstRank;
  TGstRank = longint;

const
  GST_RANK_NONE = 0;
  GST_RANK_MARGINAL = 64;
  GST_RANK_SECONDARY = 128;
  GST_RANK_PRIMARY = 256;

type
  TGstPluginFeature = record
  end;
  PGstPluginFeature = ^TGstPluginFeature;

  TGstPluginFeatureClass = record
  end;
  PGstPluginFeatureClass = ^TGstPluginFeatureClass;

  TGstPluginFeatureFilter = function(feature: PGstPluginFeature; user_data: Tgpointer): Tgboolean; cdecl;

function gst_plugin_feature_get_type: TGType; cdecl; external libgstreamer;
function gst_plugin_feature_load(feature: PGstPluginFeature): PGstPluginFeature; cdecl; external libgstreamer;
procedure gst_plugin_feature_set_rank(feature: PGstPluginFeature; rank: Tguint); cdecl; external libgstreamer;
function gst_plugin_feature_get_rank(feature: PGstPluginFeature): Tguint; cdecl; external libgstreamer;
function gst_plugin_feature_get_plugin(feature: PGstPluginFeature): PGstPlugin; cdecl; external libgstreamer;
function gst_plugin_feature_get_plugin_name(feature: PGstPluginFeature): Pgchar; cdecl; external libgstreamer;
procedure gst_plugin_feature_list_free(list: PGList); cdecl; external libgstreamer;
function gst_plugin_feature_list_copy(list: PGList): PGList; cdecl; external libgstreamer;
procedure gst_plugin_feature_list_debug(list: PGList); cdecl; external libgstreamer;

function gst_plugin_feature_check_version(feature: PGstPluginFeature; min_major: Tguint; min_minor: Tguint; min_micro: Tguint): Tgboolean; cdecl; external libgstreamer;
function gst_plugin_feature_rank_compare_func(p1: Tgconstpointer; p2: Tgconstpointer): Tgint; cdecl; external libgstreamer;

function GST_PLUGIN_FEATURE_CAST(obj: Pointer): PGstPluginFeature;
function gst_plugin_feature_get_name(feature: Pointer): Pgchar;
function gst_plugin_feature_set_name(feature: Pointer; Name: Pgchar): Tgboolean;

// === Konventiert am: 15-9-24 17:12:04 ===

function GST_TYPE_PLUGIN_FEATURE: TGType;
function GST_PLUGIN_FEATURE(obj: Pointer): PGstPluginFeature;
function GST_PLUGIN_FEATURE_CLASS(klass: Pointer): PGstPluginFeatureClass;
function GST_IS_PLUGIN_FEATURE(obj: Pointer): Tgboolean;
function GST_IS_PLUGIN_FEATURE_CLASS(klass: Pointer): Tgboolean;
function GST_PLUGIN_FEATURE_GET_CLASS(obj: Pointer): PGstPluginFeatureClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLUGIN_FEATURE: TGType;
begin
  GST_TYPE_PLUGIN_FEATURE := gst_plugin_feature_get_type;
end;

function GST_PLUGIN_FEATURE(obj: Pointer): PGstPluginFeature;
begin
  Result := PGstPluginFeature(g_type_check_instance_cast(obj, GST_TYPE_PLUGIN_FEATURE));
end;

function GST_PLUGIN_FEATURE_CLASS(klass: Pointer): PGstPluginFeatureClass;
begin
  Result := PGstPluginFeatureClass(g_type_check_class_cast(klass, GST_TYPE_PLUGIN_FEATURE));
end;

function GST_IS_PLUGIN_FEATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLUGIN_FEATURE);
end;

function GST_IS_PLUGIN_FEATURE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLUGIN_FEATURE);
end;

function GST_PLUGIN_FEATURE_GET_CLASS(obj: Pointer): PGstPluginFeatureClass;
begin
  Result := PGstPluginFeatureClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_PLUGIN_FEATURE_CAST(obj: Pointer): PGstPluginFeature;
begin
  GST_PLUGIN_FEATURE_CAST := PGstPluginFeature(obj);
end;

function gst_plugin_feature_get_name(feature: Pointer): Pgchar;
begin
  gst_plugin_feature_get_name := GST_OBJECT_NAME(feature);
end;

function gst_plugin_feature_set_name(feature: Pointer; Name: Pgchar): Tgboolean;
begin
  gst_plugin_feature_set_name := gst_object_set_name(GST_OBJECT_CAST(feature), Name);
end;


{$ENDIF read_implementation}
