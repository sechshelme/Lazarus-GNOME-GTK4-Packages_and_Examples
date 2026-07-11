unit gstplugin;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstplugin.h: Header for plugin subsystem
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_PLUGIN_H__}
{$define __GST_PLUGIN_H__}
{$include <gst/gstconfig.h>}
{$include <gst/gstobject.h>}
{$include <gst/gstmacros.h>}
{$include <gst/gststructure.h>}
{*
 * GstPlugin:
 *
 * The opaque plugin object
  }
type
{*
 * gst_plugin_error_quark:
 *
 * Get the error quark.
 *
 * Returns: The error quark used in GError messages
  }

function gst_plugin_error_quark:TGQuark;cdecl;external libgstreamer;
{*
 * GST_PLUGIN_ERROR:
 *
 * The error message category quark
  }
{ was #define dname def_expr }
function GST_PLUGIN_ERROR : longint; { return type might be wrong }

{*
 * GstPluginError:
 * @GST_PLUGIN_ERROR_MODULE: The plugin could not be loaded
 * @GST_PLUGIN_ERROR_DEPENDENCIES: The plugin has unresolved dependencies
 * @GST_PLUGIN_ERROR_NAME_MISMATCH: The plugin has already be loaded from a different file
 *
 * The plugin loading errors
  }
type
  PGstPluginError = ^TGstPluginError;
  TGstPluginError =  Longint;
  Const
    GST_PLUGIN_ERROR_MODULE = 0;
    GST_PLUGIN_ERROR_DEPENDENCIES = 1;
    GST_PLUGIN_ERROR_NAME_MISMATCH = 2;
;
{*
 * GstPluginFlags:
 * @GST_PLUGIN_FLAG_CACHED: Temporarily loaded plugins
 * @GST_PLUGIN_FLAG_BLACKLISTED: The plugin won't be scanned (again)
 *
 * The plugin loading state
  }
type
  PGstPluginFlags = ^TGstPluginFlags;
  TGstPluginFlags =  Longint;
  Const
    GST_PLUGIN_FLAG_CACHED = GST_OBJECT_FLAG_LAST shl 0;
    GST_PLUGIN_FLAG_BLACKLISTED = GST_OBJECT_FLAG_LAST shl 1;
;
{*
 * GstPluginDependencyFlags:
 * @GST_PLUGIN_DEPENDENCY_FLAG_NONE : no special flags
 * @GST_PLUGIN_DEPENDENCY_FLAG_RECURSE : recurse into subdirectories
 * @GST_PLUGIN_DEPENDENCY_FLAG_PATHS_ARE_DEFAULT_ONLY : use paths
 *         argument only if none of the environment variables is set
 * @GST_PLUGIN_DEPENDENCY_FLAG_FILE_NAME_IS_SUFFIX : interpret
 *         filename argument as filter suffix and check all matching files in
 *         the directory
 * @GST_PLUGIN_DEPENDENCY_FLAG_FILE_NAME_IS_PREFIX : interpret
 *         filename argument as filter prefix and check all matching files in
 *         the directory. Since: 1.8.
 * @GST_PLUGIN_DEPENDENCY_FLAG_PATHS_ARE_RELATIVE_TO_EXE : interpret
 *   non-absolute paths as relative to the main executable directory. Since
 *   1.14.
 *
 * Flags used in connection with gst_plugin_add_dependency().
  }
type
  PGstPluginDependencyFlags = ^TGstPluginDependencyFlags;
  TGstPluginDependencyFlags =  Longint;
  Const
    GST_PLUGIN_DEPENDENCY_FLAG_NONE = 0;
    GST_PLUGIN_DEPENDENCY_FLAG_RECURSE = 1 shl 0;
    GST_PLUGIN_DEPENDENCY_FLAG_PATHS_ARE_DEFAULT_ONLY = 1 shl 1;
    GST_PLUGIN_DEPENDENCY_FLAG_FILE_NAME_IS_SUFFIX = 1 shl 2;
    GST_PLUGIN_DEPENDENCY_FLAG_FILE_NAME_IS_PREFIX = 1 shl 3;
    GST_PLUGIN_DEPENDENCY_FLAG_PATHS_ARE_RELATIVE_TO_EXE = 1 shl 4;
;
{*
 * GstPluginInitFunc:
 * @plugin: The plugin object
 *
 * A plugin should provide a pointer to a function of this type in the
 * plugin_desc struct.
 * This function will be called by the loader at startup. One would then
 * register each #GstPluginFeature.
 *
 * Returns: %TRUE if plugin initialised successfully
  }
{ FIXME 0.11: Make return void  }
type

  TGstPluginInitFunc = function (plugin:PGstPlugin):Tgboolean;cdecl;
{*
 * GstPluginInitFullFunc:
 * @plugin: The plugin object
 * @user_data: extra data
 *
 * A plugin should provide a pointer to a function of either #GstPluginInitFunc
 * or this type in the plugin_desc struct.
 * The function will be called by the loader at startup. One would then
 * register each #GstPluginFeature. This version allows
 * user data to be passed to init function (useful for bindings).
 *
 * Returns: %TRUE if plugin initialised successfully
  }
{ FIXME 0.11: Merge with GstPluginInitFunc  }

  TGstPluginInitFullFunc = function (plugin:PGstPlugin; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstPluginDesc:
 * @major_version: the major version number of core that plugin was compiled for
 * @minor_version: the minor version number of core that plugin was compiled for
 * @name: a unique name of the plugin
 * @description: description of plugin
 * @plugin_init: pointer to the init function of this plugin.
 * @version: version of the plugin
 * @license: effective license of plugin
 * @source: source module plugin belongs to
 * @package: shipped package plugin belongs to
 * @origin: URL to provider of plugin
 * @release_datetime: (allow-none): date time string in ISO 8601
 *     format (or rather, a subset thereof), or %NULL. Allowed are the
 *     following formats: "YYYY-MM-DD" and "YYY-MM-DDTHH:MMZ" (with
 *     'T' a separator and 'Z' indicating UTC/Zulu time). This field
 *     should be set via the GST_PACKAGE_RELEASE_DATETIME
 *     preprocessor macro.
 *
 * A plugin should export a variable of this type called plugin_desc. The plugin
 * loader will use the data provided there to initialize the plugin.
 *
 * The @licence parameter must be one of: LGPL, GPL, QPL, GPL/QPL, MPL,
 * BSD, MIT/X11, Proprietary, unknown.
  }
{< private > }
  PGstPluginDesc = ^TGstPluginDesc;
  TGstPluginDesc = record
      major_version : Tgint;cdecl;
      minor_version : Tgint;
      name : Pgchar;
      description : Pgchar;
      plugin_init : TGstPluginInitFunc;
      version : Pgchar;
      license : Pgchar;
      source : Pgchar;
      package : Pgchar;
      origin : Pgchar;
      release_datetime : Pgchar;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


{ was #define dname def_expr }
function GST_TYPE_PLUGIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLUGIN_CAST(obj : longint) : PGstPlugin;

{*
 * GST_LICENSE_UNKNOWN:
 *
 * To be used in GST_PLUGIN_DEFINE if unsure about the licence.
  }
const
  GST_LICENSE_UNKNOWN = 'unknown';  
{ function for filters  }
{*
 * GstPluginFilter:
 * @plugin: the plugin to check
 * @user_data: the user_data that has been passed on e.g. gst_registry_plugin_filter()
 *
 * A function that can be used with e.g. gst_registry_plugin_filter()
 * to get a list of plugins that match certain criteria.
 *
 * Returns: %TRUE for a positive match, %FALSE otherwise
  }
type

  TGstPluginFilter = function (plugin:PGstPlugin; user_data:Tgpointer):Tgboolean;cdecl;

function gst_plugin_get_type:TGType;cdecl;external libgstreamer;
function gst_plugin_register_static(major_version:Tgint; minor_version:Tgint; name:Pgchar; description:Pgchar; init_func:TGstPluginInitFunc; 
           version:Pgchar; license:Pgchar; source:Pgchar; package:Pgchar; origin:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_plugin_register_static_full(major_version:Tgint; minor_version:Tgint; name:Pgchar; description:Pgchar; init_full_func:TGstPluginInitFullFunc; 
           version:Pgchar; license:Pgchar; source:Pgchar; package:Pgchar; origin:Pgchar; 
           user_data:Tgpointer):Tgboolean;cdecl;external libgstreamer;
function gst_plugin_get_name(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_description(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_filename(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_version(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_license(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_source(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_package(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_origin(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_release_date_string(plugin:PGstPlugin):Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_cache_data(plugin:PGstPlugin):PGstStructure;cdecl;external libgstreamer;
procedure gst_plugin_set_cache_data(plugin:PGstPlugin; cache_data:PGstStructure);cdecl;external libgstreamer;
function gst_plugin_is_loaded(plugin:PGstPlugin):Tgboolean;cdecl;external libgstreamer;
function gst_plugin_load_file(filename:Pgchar; error:PPGError):PGstPlugin;cdecl;external libgstreamer;
function gst_plugin_load(plugin:PGstPlugin):PGstPlugin;cdecl;external libgstreamer;
function gst_plugin_load_by_name(name:Pgchar):PGstPlugin;cdecl;external libgstreamer;
procedure gst_plugin_add_dependency(plugin:PGstPlugin; env_vars:PPgchar; paths:PPgchar; names:PPgchar; flags:TGstPluginDependencyFlags);cdecl;external libgstreamer;
procedure gst_plugin_add_dependency_simple(plugin:PGstPlugin; env_vars:Pgchar; paths:Pgchar; names:Pgchar; flags:TGstPluginDependencyFlags);cdecl;external libgstreamer;
procedure gst_plugin_add_status_error(plugin:PGstPlugin; message:Pgchar);cdecl;external libgstreamer;
procedure gst_plugin_add_status_warning(plugin:PGstPlugin; message:Pgchar);cdecl;external libgstreamer;
procedure gst_plugin_add_status_info(plugin:PGstPlugin; message:Pgchar);cdecl;external libgstreamer;
function gst_plugin_get_status_errors(plugin:PGstPlugin):^Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_status_warnings(plugin:PGstPlugin):^Pgchar;cdecl;external libgstreamer;
function gst_plugin_get_status_infos(plugin:PGstPlugin):^Pgchar;cdecl;external libgstreamer;
procedure gst_plugin_list_free(list:PGList);cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstPlugin, gst_object_unref) }
{$endif}
{ __GST_PLUGIN_H__  }

// === Konventiert am: 11-7-26 15:17:05 ===


implementation


{ was #define dname def_expr }
function GST_PLUGIN_ERROR : longint; { return type might be wrong }
  begin
    GST_PLUGIN_ERROR:=gst_plugin_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_PLUGIN : longint; { return type might be wrong }
  begin
    GST_TYPE_PLUGIN:=gst_plugin_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN(obj : longint) : longint;
begin
  GST_IS_PLUGIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLUGIN_CLASS(klass : longint) : longint;
begin
  GST_IS_PLUGIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_GET_CLASS(obj : longint) : longint;
begin
  GST_PLUGIN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLUGIN,GstPluginClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN(obj : longint) : longint;
begin
  GST_PLUGIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLUGIN,GstPlugin);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLUGIN_CLASS(klass : longint) : longint;
begin
  GST_PLUGIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLUGIN,GstPluginClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLUGIN_CAST(obj : longint) : PGstPlugin;
begin
  GST_PLUGIN_CAST:=PGstPlugin(obj);
end;


end.
