
unit gsttracer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttracer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttracer.h
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
Pgchar  = ^gchar;
PGList  = ^GList;
PGstPlugin  = ^GstPlugin;
PGstTracer  = ^GstTracer;
PGstTracerClass  = ^GstTracerClass;
PGstTracerPrivate  = ^GstTracerPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2013 Stefan Sauer <ensonic@users.sf.net>
 *
 * gsttracer.h: tracer base class
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
{$ifndef __GST_TRACER_H__}
{$define __GST_TRACER_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/gstobject.h>}
{$include <gst/gstconfig.h>}
type

{ was #define dname def_expr }
function GST_TYPE_TRACER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_CAST(obj : longint) : PGstTracer;

{*
 * GstTracer:
 *
 * The opaque GstTracer instance structure
  }
{< private > }
type
  PGstTracer = ^TGstTracer;
  TGstTracer = record
      parent : TGstObject;
      priv : PGstTracerPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstTracerClass = ^TGstTracerClass;
  TGstTracerClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_tracer_get_type:TGType;cdecl;external;
(* Const before type ignored *)
procedure gst_tracing_register_hook(tracer:PGstTracer; detail:Pgchar; func:TGCallback);cdecl;external;
{ tracing modules  }
(* Const before type ignored *)
function gst_tracer_register(plugin:PGstPlugin; name:Pgchar; _type:TGType):Tgboolean;cdecl;external;
function gst_tracing_get_active_tracers:PGList;cdecl;external;
function gst_tracer_class_uses_structure_params(tracer_class:PGstTracerClass):Tgboolean;cdecl;external;
procedure gst_tracer_class_set_use_structure_params(tracer_class:PGstTracerClass; use_structure_params:Tgboolean);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTracer, gst_object_unref) }
{$endif}
{ __GST_TRACER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TRACER : longint; { return type might be wrong }
  begin
    GST_TYPE_TRACER:=gst_tracer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER(obj : longint) : longint;
begin
  GST_TRACER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TRACER,GstTracer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_CLASS(klass : longint) : longint;
begin
  GST_TRACER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_TRACER,GstTracerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER(obj : longint) : longint;
begin
  GST_IS_TRACER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TRACER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_CLASS(klass : longint) : longint;
begin
  GST_IS_TRACER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_TRACER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_GET_CLASS(obj : longint) : longint;
begin
  GST_TRACER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_TRACER,GstTracerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_CAST(obj : longint) : PGstTracer;
begin
  GST_TRACER_CAST:=PGstTracer(obj);
end;


end.
