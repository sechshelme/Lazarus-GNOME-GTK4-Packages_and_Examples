
{$IFDEF read_interface}

type
  TGstRegistryPrivate = record
  end;
  PGstRegistryPrivate = ^TGstRegistryPrivate;

  TGstRegistry = record
    obj: TGstObject;
    priv: PGstRegistryPrivate;
  end;
  PGstRegistry = ^TGstRegistry;

  TGstRegistryClass = record
    parent_class: TGstObjectClass;
  end;
  PGstRegistryClass = ^TGstRegistryClass;

function gst_registry_get_type: TGType; cdecl; external libgstreamer;
function gst_registry_get: PGstRegistry; cdecl; external libgstreamer;
function gst_registry_scan_path(registry: PGstRegistry; path: Pgchar): Tgboolean; cdecl; external libgstreamer;
procedure gst_registry_add_path(registry: PGstRegistry; path: Pgchar); cdecl; external libgstreamer;
function gst_registry_get_path_list(registry: PGstRegistry): PGList; cdecl; external libgstreamer;
function gst_registry_add_plugin(registry: PGstRegistry; plugin: PGstPlugin): Tgboolean; cdecl; external libgstreamer;
procedure gst_registry_remove_plugin(registry: PGstRegistry; plugin: PGstPlugin); cdecl; external libgstreamer;
function gst_registry_add_feature(registry: PGstRegistry; feature: PGstPluginFeature): Tgboolean; cdecl; external libgstreamer;
procedure gst_registry_remove_feature(registry: PGstRegistry; feature: PGstPluginFeature); cdecl; external libgstreamer;
function gst_registry_get_plugin_list(registry: PGstRegistry): PGList; cdecl; external libgstreamer;
function gst_registry_plugin_filter(registry: PGstRegistry; filter: TGstPluginFilter; First: Tgboolean; user_data: Tgpointer): PGList; cdecl; external libgstreamer;
function gst_registry_feature_filter(registry: PGstRegistry; filter: TGstPluginFeatureFilter; First: Tgboolean; user_data: Tgpointer): PGList; cdecl; external libgstreamer;
function gst_registry_get_feature_list(registry: PGstRegistry; _type: TGType): PGList; cdecl; external libgstreamer;
function gst_registry_get_feature_list_by_plugin(registry: PGstRegistry; Name: Pgchar): PGList; cdecl; external libgstreamer;
function gst_registry_get_feature_list_cookie(registry: PGstRegistry): Tguint32; cdecl; external libgstreamer;
function gst_registry_find_plugin(registry: PGstRegistry; Name: Pgchar): PGstPlugin; cdecl; external libgstreamer;
function gst_registry_find_feature(registry: PGstRegistry; Name: Pgchar; _type: TGType): PGstPluginFeature; cdecl; external libgstreamer;
function gst_registry_lookup(registry: PGstRegistry; filename: PChar): PGstPlugin; cdecl; external libgstreamer;
function gst_registry_lookup_feature(registry: PGstRegistry; Name: PChar): PGstPluginFeature; cdecl; external libgstreamer;
function gst_registry_check_feature_version(registry: PGstRegistry; feature_name: Pgchar; min_major: Tguint; min_minor: Tguint; min_micro: Tguint): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 16-9-24 17:57:38 ===

function GST_TYPE_REGISTRY: TGType;
function GST_REGISTRY(obj: Pointer): PGstRegistry;
function GST_REGISTRY_CLASS(klass: Pointer): PGstRegistryClass;
function GST_IS_REGISTRY(obj: Pointer): Tgboolean;
function GST_IS_REGISTRY_CLASS(klass: Pointer): Tgboolean;
function GST_REGISTRY_GET_CLASS(obj: Pointer): PGstRegistryClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_REGISTRY: TGType;
begin
  GST_TYPE_REGISTRY := gst_registry_get_type;
end;

function GST_REGISTRY(obj: Pointer): PGstRegistry;
begin
  Result := PGstRegistry(g_type_check_instance_cast(obj, GST_TYPE_REGISTRY));
end;

function GST_REGISTRY_CLASS(klass: Pointer): PGstRegistryClass;
begin
  Result := PGstRegistryClass(g_type_check_class_cast(klass, GST_TYPE_REGISTRY));
end;

function GST_IS_REGISTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_REGISTRY);
end;

function GST_IS_REGISTRY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_REGISTRY);
end;

function GST_REGISTRY_GET_CLASS(obj: Pointer): PGstRegistryClass;
begin
  Result := PGstRegistryClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
