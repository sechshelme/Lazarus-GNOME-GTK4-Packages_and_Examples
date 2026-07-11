
unit gstregistry;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstregistry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstregistry.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pgchar  = ^gchar;
PGList  = ^GList;
PGstPlugin  = ^GstPlugin;
PGstPluginFeature  = ^GstPluginFeature;
PGstRegistry  = ^GstRegistry;
PGstRegistryClass  = ^GstRegistryClass;
PGstRegistryPrivate  = ^GstRegistryPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *
 * gstregistry.h: Header for registry handling
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
{$ifndef __GST_REGISTRY_H__}
{$define __GST_REGISTRY_H__}
{$include <gst/gstconfig.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}

{ was #define dname def_expr }
function GST_TYPE_REGISTRY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_REGISTRY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_REGISTRY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_REGISTRY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_REGISTRY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_REGISTRY_GET_CLASS(obj : longint) : longint;

type
{*
 * GstRegistry:
 *
 * Opaque #GstRegistry structure.
  }
{< private > }
  PGstRegistry = ^TGstRegistry;
  TGstRegistry = record
      object : TGstObject;
      priv : PGstRegistryPrivate;
    end;

  PGstRegistryClass = ^TGstRegistryClass;
  TGstRegistryClass = record
      parent_class : TGstObjectClass;
    end;


function gst_registry_get_type:TGType;cdecl;external;
function gst_registry_get:PGstRegistry;cdecl;external;
(* Const before type ignored *)
function gst_registry_scan_path(registry:PGstRegistry; path:Pgchar):Tgboolean;cdecl;external;
{$if 0}
(* Const before type ignored *)

procedure gst_registry_add_path(registry:PGstRegistry; path:Pgchar);cdecl;external;
function gst_registry_get_path_list(registry:PGstRegistry):PGList;cdecl;external;
{$endif}

function gst_registry_add_plugin(registry:PGstRegistry; plugin:PGstPlugin):Tgboolean;cdecl;external;
procedure gst_registry_remove_plugin(registry:PGstRegistry; plugin:PGstPlugin);cdecl;external;
function gst_registry_add_feature(registry:PGstRegistry; feature:PGstPluginFeature):Tgboolean;cdecl;external;
procedure gst_registry_remove_feature(registry:PGstRegistry; feature:PGstPluginFeature);cdecl;external;
function gst_registry_get_plugin_list(registry:PGstRegistry):PGList;cdecl;external;
function gst_registry_plugin_filter(registry:PGstRegistry; filter:TGstPluginFilter; first:Tgboolean; user_data:Tgpointer):PGList;cdecl;external;
function gst_registry_feature_filter(registry:PGstRegistry; filter:TGstPluginFeatureFilter; first:Tgboolean; user_data:Tgpointer):PGList;cdecl;external;
function gst_registry_get_feature_list(registry:PGstRegistry; _type:TGType):PGList;cdecl;external;
(* Const before type ignored *)
function gst_registry_get_feature_list_by_plugin(registry:PGstRegistry; name:Pgchar):PGList;cdecl;external;
function gst_registry_get_feature_list_cookie(registry:PGstRegistry):Tguint32;cdecl;external;
(* Const before type ignored *)
function gst_registry_find_plugin(registry:PGstRegistry; name:Pgchar):PGstPlugin;cdecl;external;
(* Const before type ignored *)
function gst_registry_find_feature(registry:PGstRegistry; name:Pgchar; _type:TGType):PGstPluginFeature;cdecl;external;
(* Const before type ignored *)
function gst_registry_lookup(registry:PGstRegistry; filename:Pchar):PGstPlugin;cdecl;external;
(* Const before type ignored *)
function gst_registry_lookup_feature(registry:PGstRegistry; name:Pchar):PGstPluginFeature;cdecl;external;
(* Const before type ignored *)
function gst_registry_check_feature_version(registry:PGstRegistry; feature_name:Pgchar; min_major:Tguint; min_minor:Tguint; min_micro:Tguint):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstRegistry, gst_object_unref) }
{$endif}
{ __GST_REGISTRY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_REGISTRY : longint; { return type might be wrong }
  begin
    GST_TYPE_REGISTRY:=gst_registry_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_REGISTRY(obj : longint) : longint;
begin
  GST_REGISTRY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_REGISTRY,GstRegistry);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_REGISTRY(obj : longint) : longint;
begin
  GST_IS_REGISTRY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_REGISTRY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_REGISTRY_CLASS(klass : longint) : longint;
begin
  GST_REGISTRY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_REGISTRY,GstRegistryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_REGISTRY_CLASS(klass : longint) : longint;
begin
  GST_IS_REGISTRY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_REGISTRY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_REGISTRY_GET_CLASS(obj : longint) : longint;
begin
  GST_REGISTRY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_REGISTRY,GstRegistryClass);
end;


end.
