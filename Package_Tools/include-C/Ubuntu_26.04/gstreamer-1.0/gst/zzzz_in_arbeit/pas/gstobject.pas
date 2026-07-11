unit gstobject;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstobject.h: Header for base GstObject
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
{$ifndef __GST_OBJECT_H__}
{$define __GST_OBJECT_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function GST_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OBJECT_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OBJECT_CAST(obj : longint) : PGstObject;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OBJECT_CLASS_CAST(klass : longint) : PGstObjectClass;

{*
 * GST_OBJECT_FLAG_CONSTRUCTED:
 *
 * Flag that's set when the object has been constructed. This can be used by
 * API such as base class setters to differentiate between the case where
 * they're called from a subclass's instance init function (and where the
 * object isn't fully constructed yet, and so one shouldn't do anything but
 * set values in the instance structure), and the case where the object is
 * constructed.
 *
 * Since: 1.24
  }
{*
 * GstObjectFlags:
 * @GST_OBJECT_FLAG_MAY_BE_LEAKED: the object is expected to stay alive even
 * after gst_deinit() has been called and so should be ignored by leak
 * detection tools. (Since: 1.10)
 * @GST_OBJECT_FLAG_CONSTRUCTED: flag that's set when the object has been
 * constructed. This can be used by API such as base class setters to
 * differentiate between the case where they're called from a subclass's
 * instance init function (and where the object isn't fully constructed yet,
 * and so one shouldn't do anything but set values in the instance structure),
 * and the case where the object is constructed. (Since: 1.24)
 * @GST_OBJECT_FLAG_LAST: subclasses can add additional flags starting from this flag
 *
 * The standard flags that an gstobject may have.
  }
{ padding  }
type
  PGstObjectFlags = ^TGstObjectFlags;
  TGstObjectFlags =  Longint;
  Const
    GST_OBJECT_FLAG_MAY_BE_LEAKED = 1 shl 0;
    GST_OBJECT_FLAG_CONSTRUCTED = 1 shl 1;
    GST_OBJECT_FLAG_LAST = 1 shl 4;
;
type
{*
 * GstObject:
 * @lock: object LOCK
 * @name: The name of the object
 * @parent: this object's parent, weak ref
 * @flags: flags for this object
 *
 * GStreamer base object class.
  }
{< public > }{ with LOCK  }
{ object LOCK  }
{ object name  }
{ this object's parent, weak ref  }
{< private > }
{ List of GstControlBinding  }
  PGstObject = ^TGstObject;
  TGstObject = record
      object : TGInitiallyUnowned;
      lock : TGMutex;
      name : Pgchar;
      parent : PGstObject;
      flags : Tguint32;
      control_bindings : PGList;
      control_rate : Tguint64;
      last_sync : Tguint64;
      _gst_reserved : Tgpointer;
    end;

{*
 * GstObjectClass:
 * @parent_class: parent
 * @path_string_separator: separator used by gst_object_get_path_string()
 * @deep_notify: default signal handler
 *
 * GStreamer base object class.
  }
{ signals  }
{< public > }
{ virtual methods for subclasses  }
{< private > }
  PGstObjectClass = ^TGstObjectClass;
  TGstObjectClass = record
      parent_class : TGInitiallyUnownedClass;
      path_string_separator : Pgchar;
      deep_notify : procedure (object:PGstObject; orig:PGstObject; pspec:PGParamSpec);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ normal GObject stuff  }

function gst_object_get_type:TGType;cdecl;external libgstreamer;
{ name routines  }
function gst_object_set_name(object:PGstObject; name:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_object_get_name(object:PGstObject):Pgchar;cdecl;external libgstreamer;
{ parentage routines  }
function gst_object_set_parent(object:PGstObject; parent:PGstObject):Tgboolean;cdecl;external libgstreamer;
function gst_object_get_parent(object:PGstObject):PGstObject;cdecl;external libgstreamer;
function gst_object_get_toplevel(object:PGstObject):PGstObject;cdecl;external libgstreamer;
procedure gst_object_unparent(object:PGstObject);cdecl;external libgstreamer;
function gst_object_has_as_parent(object:PGstObject; parent:PGstObject):Tgboolean;cdecl;external libgstreamer;
function gst_object_has_as_ancestor(object:PGstObject; ancestor:PGstObject):Tgboolean;cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_object_has_as_ancestor) }
function gst_object_has_ancestor(object:PGstObject; ancestor:PGstObject):Tgboolean;cdecl;external libgstreamer;
procedure gst_object_default_deep_notify(object:PGObject; orig:PGstObject; pspec:PGParamSpec; excluded_props:PPgchar);cdecl;external libgstreamer;
{ refcounting + life cycle  }
function gst_object_ref(object:Tgpointer):Tgpointer;cdecl;external libgstreamer;
procedure gst_object_unref(object:Tgpointer);cdecl;external libgstreamer;
procedure gst_clear_object(object_ptr:PPGstObject);cdecl;external libgstreamer;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_clear_object(object_ptr : longint) : longint;

function gst_object_ref_sink(object:Tgpointer):Tgpointer;cdecl;external libgstreamer;
{ replace object pointer  }
function gst_object_replace(oldobj:PPGstObject; newobj:PGstObject):Tgboolean;cdecl;external libgstreamer;
{ printing out the 'path' of the object  }
function gst_object_get_path_string(object:PGstObject):Pgchar;cdecl;external libgstreamer;
{ misc utils  }
function gst_object_check_uniqueness(list:PGList; name:Pgchar):Tgboolean;cdecl;external libgstreamer;
{ controller functions  }
{$include <gst/gstcontrolbinding.h>}
{$include <gst/gstcontrolsource.h>}

function gst_object_suggest_next_sync(object:PGstObject):TGstClockTime;cdecl;external libgstreamer;
function gst_object_sync_values(object:PGstObject; timestamp:TGstClockTime):Tgboolean;cdecl;external libgstreamer;
function gst_object_has_active_control_bindings(object:PGstObject):Tgboolean;cdecl;external libgstreamer;
procedure gst_object_set_control_bindings_disabled(object:PGstObject; disabled:Tgboolean);cdecl;external libgstreamer;
procedure gst_object_set_control_binding_disabled(object:PGstObject; property_name:Pgchar; disabled:Tgboolean);cdecl;external libgstreamer;
function gst_object_add_control_binding(object:PGstObject; binding:PGstControlBinding):Tgboolean;cdecl;external libgstreamer;
function gst_object_get_control_binding(object:PGstObject; property_name:Pgchar):PGstControlBinding;cdecl;external libgstreamer;
function gst_object_remove_control_binding(object:PGstObject; binding:PGstControlBinding):Tgboolean;cdecl;external libgstreamer;
function gst_object_get_value(object:PGstObject; property_name:Pgchar; timestamp:TGstClockTime):PGValue;cdecl;external libgstreamer;
function gst_object_get_value_array(object:PGstObject; property_name:Pgchar; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; 
           values:Tgpointer):Tgboolean;cdecl;external libgstreamer;
function gst_object_get_g_value_array(object:PGstObject; property_name:Pgchar; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; 
           values:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_object_get_control_rate(object:PGstObject):TGstClockTime;cdecl;external libgstreamer;
procedure gst_object_set_control_rate(object:PGstObject; control_rate:TGstClockTime);cdecl;external libgstreamer;
{*
 * GstObjectCallAsyncFunc:
 * @object: A #GstObject this function has been called against
 * @user_data: Data passed in the function where that callback has been passed
 *
 * Callback prototype used in #gst_object_call_async
 *
 * Since: 1.28
  }
type

  TGstObjectCallAsyncFunc = procedure (object:PGstObject; user_data:Tgpointer);cdecl;

procedure gst_object_call_async(object:PGstObject; func:TGstObjectCallAsyncFunc; user_data:Tgpointer);cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstObject, gst_object_unref) }
{$endif}
{ __GST_OBJECT_H__  }

// === Konventiert am: 11-7-26 15:18:14 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    GST_TYPE_OBJECT:=gst_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OBJECT(obj : longint) : longint;
begin
  GST_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OBJECT_CLASS(klass : longint) : longint;
begin
  GST_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OBJECT_GET_CLASS(obj : longint) : longint;
begin
  GST_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_OBJECT,GstObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OBJECT(obj : longint) : longint;
begin
  GST_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_OBJECT,GstObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OBJECT_CLASS(klass : longint) : longint;
begin
  GST_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_OBJECT,GstObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OBJECT_CAST(obj : longint) : PGstObject;
begin
  GST_OBJECT_CAST:=PGstObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OBJECT_CLASS_CAST(klass : longint) : PGstObjectClass;
begin
  GST_OBJECT_CLASS_CAST:=PGstObjectClass(klass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_clear_object(object_ptr : longint) : longint;
begin
  gst_clear_object:=g_clear_pointer(object_ptr,gst_object_unref);
end;


end.
