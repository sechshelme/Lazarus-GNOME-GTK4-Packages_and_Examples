unit gstregistry;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstobject, gstplugin, gstpluginfeature;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRegistryPrivate = type Pointer;

  PGstRegistry = ^TGstRegistry;
  TGstRegistry = record
    obj: TGstObject;
    priv: PGstRegistryPrivate;
  end;

  PGstRegistryClass = ^TGstRegistryClass;
  TGstRegistryClass = record
    parent_class: TGstObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_registry_get_type: TGType; cdecl; external libgstreamer;
function gst_registry_get: PGstRegistry; cdecl; external libgstreamer;
function gst_registry_scan_path(registry: PGstRegistry; path: Pgchar): Tgboolean; cdecl; external libgstreamer;

function gst_registry_add_plugin(registry: PGstRegistry; plugin: PGstPlugin): Tgboolean; cdecl; external libgstreamer;
procedure gst_registry_remove_plugin(registry: PGstRegistry; plugin: PGstPlugin); cdecl; external libgstreamer;
function gst_registry_add_feature(registry: PGstRegistry; feature: PGstPluginFeature): Tgboolean; cdecl; external libgstreamer;
procedure gst_registry_remove_feature(registry: PGstRegistry; feature: PGstPluginFeature); cdecl; external libgstreamer;
function gst_registry_get_plugin_list(registry: PGstRegistry): PGList; cdecl; external libgstreamer;
function gst_registry_plugin_filter(registry: PGstRegistry; filter: TGstPluginFilter; first: Tgboolean; user_data: Tgpointer): PGList; cdecl; external libgstreamer;
function gst_registry_feature_filter(registry: PGstRegistry; filter: TGstPluginFeatureFilter; first: Tgboolean; user_data: Tgpointer): PGList; cdecl; external libgstreamer;
function gst_registry_get_feature_list(registry: PGstRegistry; _type: TGType): PGList; cdecl; external libgstreamer;
function gst_registry_get_feature_list_by_plugin(registry: PGstRegistry; name: Pgchar): PGList; cdecl; external libgstreamer;
function gst_registry_get_feature_list_cookie(registry: PGstRegistry): Tguint32; cdecl; external libgstreamer;
function gst_registry_find_plugin(registry: PGstRegistry; name: Pgchar): PGstPlugin; cdecl; external libgstreamer;
function gst_registry_find_feature(registry: PGstRegistry; name: Pgchar; _type: TGType): PGstPluginFeature; cdecl; external libgstreamer;
function gst_registry_lookup(registry: PGstRegistry; filename: pchar): PGstPlugin; cdecl; external libgstreamer;
function gst_registry_lookup_feature(registry: PGstRegistry; name: pchar): PGstPluginFeature; cdecl; external libgstreamer;
function gst_registry_check_feature_version(registry: PGstRegistry; feature_name: Pgchar; min_major: Tguint; min_minor: Tguint; min_micro: Tguint): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:24:43 ===

function GST_TYPE_REGISTRY: TGType;
function GST_REGISTRY(obj: Pointer): PGstRegistry;
function GST_REGISTRY_CLASS(klass: Pointer): PGstRegistryClass;
function GST_IS_REGISTRY(obj: Pointer): Tgboolean;
function GST_IS_REGISTRY_CLASS(klass: Pointer): Tgboolean;
function GST_REGISTRY_GET_CLASS(obj: Pointer): PGstRegistryClass;
{$ENDIF read_function}

implementation

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

end.
