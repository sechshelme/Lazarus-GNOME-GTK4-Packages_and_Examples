/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_plugin_error_quark: TGQuark; cdecl; external libgstreamer;

type
  PGstPluginError = ^TGstPluginError;
  TGstPluginError = longint;

const
  GST_PLUGIN_ERROR_MODULE = 0;
  GST_PLUGIN_ERROR_DEPENDENCIES = 1;
  GST_PLUGIN_ERROR_NAME_MISMATCH = 2;

type
  PGstPluginFlags = ^TGstPluginFlags;
  TGstPluginFlags = longint;

const
  GST_PLUGIN_FLAG_CACHED = GST_OBJECT_FLAG_LAST shl 0;
  GST_PLUGIN_FLAG_BLACKLISTED = GST_OBJECT_FLAG_LAST shl 1;

type
  PGstPluginDependencyFlags = ^TGstPluginDependencyFlags;
  TGstPluginDependencyFlags = longint;

const
  GST_PLUGIN_DEPENDENCY_FLAG_NONE = 0;
  GST_PLUGIN_DEPENDENCY_FLAG_RECURSE = 1 shl 0;
  GST_PLUGIN_DEPENDENCY_FLAG_PATHS_ARE_DEFAULT_ONLY = 1 shl 1;
  GST_PLUGIN_DEPENDENCY_FLAG_FILE_NAME_IS_SUFFIX = 1 shl 2;
  GST_PLUGIN_DEPENDENCY_FLAG_FILE_NAME_IS_PREFIX = 1 shl 3;
  GST_PLUGIN_DEPENDENCY_FLAG_PATHS_ARE_RELATIVE_TO_EXE = 1 shl 4;

type
  TGstPlugin = record
  end;
  PGstPlugin = ^TGstPlugin;

  TGstPluginClass = record
  end;
  PGstPluginClass = ^TGstPluginClass;

  TGstPluginInitFunc = function(plugin: PGstPlugin): Tgboolean; cdecl;
  TGstPluginInitFullFunc = function(plugin: PGstPlugin; user_data: Tgpointer): Tgboolean; cdecl;
  PGstPluginDesc = ^TGstPluginDesc;

  TGstPluginDesc = record
    major_version: Tgint;
    minor_version: Tgint;
    Name: Pgchar;
    description: Pgchar;
    plugin_init: TGstPluginInitFunc;
    version: Pgchar;
    license: Pgchar;
    Source: Pgchar;
    package: Pgchar;
    origin: Pgchar;
    release_datetime: Pgchar;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


const
  GST_LICENSE_UNKNOWN = 'unknown';

type
  TGstPluginFilter = function(plugin: PGstPlugin; user_data: Tgpointer): Tgboolean; cdecl;

function gst_plugin_get_type: TGType; cdecl; external libgstreamer;
function gst_plugin_register_static(major_version: Tgint; minor_version: Tgint; Name: Pgchar; description: Pgchar; init_func: TGstPluginInitFunc;
  version: Pgchar; license: Pgchar; Source: Pgchar; package: Pgchar; origin: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_plugin_register_static_full(major_version: Tgint; minor_version: Tgint; Name: Pgchar; description: Pgchar; init_full_func: TGstPluginInitFullFunc;
  version: Pgchar; license: Pgchar; Source: Pgchar; package: Pgchar; origin: Pgchar;
  user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_plugin_get_name(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_description(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_filename(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_version(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_license(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_source(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_package(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_origin(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_release_date_string(plugin: PGstPlugin): Pgchar; cdecl; external libgstreamer;
function gst_plugin_get_cache_data(plugin: PGstPlugin): PGstStructure; cdecl; external libgstreamer;
procedure gst_plugin_set_cache_data(plugin: PGstPlugin; cache_data: PGstStructure); cdecl; external libgstreamer;
function gst_plugin_is_loaded(plugin: PGstPlugin): Tgboolean; cdecl; external libgstreamer;
function gst_plugin_load_file(filename: Pgchar; error: PPGError): PGstPlugin; cdecl; external libgstreamer;
function gst_plugin_load(plugin: PGstPlugin): PGstPlugin; cdecl; external libgstreamer;
function gst_plugin_load_by_name(Name: Pgchar): PGstPlugin; cdecl; external libgstreamer;
procedure gst_plugin_add_dependency(plugin: PGstPlugin; env_vars: PPgchar; paths: PPgchar; names: PPgchar; flags: TGstPluginDependencyFlags); cdecl; external libgstreamer;
procedure gst_plugin_add_dependency_simple(plugin: PGstPlugin; env_vars: Pgchar; paths: Pgchar; names: Pgchar; flags: TGstPluginDependencyFlags); cdecl; external libgstreamer;
procedure gst_plugin_add_status_error(plugin: PGstPlugin; message: Pgchar); cdecl; external libgstreamer;
procedure gst_plugin_add_status_warning(plugin: PGstPlugin; message: Pgchar); cdecl; external libgstreamer;
procedure gst_plugin_add_status_info(plugin: PGstPlugin; message: Pgchar); cdecl; external libgstreamer;
function gst_plugin_get_status_errors(plugin: PGstPlugin): PPgchar; cdecl; external libgstreamer;
function gst_plugin_get_status_warnings(plugin: PGstPlugin): PPgchar; cdecl; external libgstreamer;
function gst_plugin_get_status_infos(plugin: PGstPlugin): PPgchar; cdecl; external libgstreamer;
procedure gst_plugin_list_free(list: PGList); cdecl; external libgstreamer;

function GST_PLUGIN_CAST(obj: Pointer): PGstPlugin;
function GST_PLUGIN_ERROR: TGQuark;

// === Konventiert am: 15-9-24 17:03:40 ===

function GST_TYPE_PLUGIN: TGType;
function GST_PLUGIN(obj: Pointer): PGstPlugin;
function GST_PLUGIN_CLASS(klass: Pointer): PGstPluginClass;
function GST_IS_PLUGIN(obj: Pointer): Tgboolean;
function GST_IS_PLUGIN_CLASS(klass: Pointer): Tgboolean;
function GST_PLUGIN_GET_CLASS(obj: Pointer): PGstPluginClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLUGIN: TGType;
begin
  GST_TYPE_PLUGIN := gst_plugin_get_type;
end;

function GST_PLUGIN(obj: Pointer): PGstPlugin;
begin
  Result := PGstPlugin(g_type_check_instance_cast(obj, GST_TYPE_PLUGIN));
end;

function GST_PLUGIN_CLASS(klass: Pointer): PGstPluginClass;
begin
  Result := PGstPluginClass(g_type_check_class_cast(klass, GST_TYPE_PLUGIN));
end;

function GST_IS_PLUGIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLUGIN);
end;

function GST_IS_PLUGIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLUGIN);
end;

function GST_PLUGIN_GET_CLASS(obj: Pointer): PGstPluginClass;
begin
  Result := PGstPluginClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_PLUGIN_CAST(obj: Pointer): PGstPlugin;
begin
  GST_PLUGIN_CAST := PGstPlugin(obj);
end;

function GST_PLUGIN_ERROR: TGQuark;
begin
  GST_PLUGIN_ERROR := gst_plugin_error_quark;
end;


{$ENDIF read_implementation}
