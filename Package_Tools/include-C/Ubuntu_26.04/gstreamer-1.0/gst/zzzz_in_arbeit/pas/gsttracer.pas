unit gsttracer;

interface

uses
  fp_glib2, fp_gst;

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


function gst_tracer_get_type:TGType;cdecl;external libgstreamer;
procedure gst_tracing_register_hook(tracer:PGstTracer; detail:Pgchar; func:TGCallback);cdecl;external libgstreamer;
{ tracing modules  }
function gst_tracer_register(plugin:PGstPlugin; name:Pgchar; _type:TGType):Tgboolean;cdecl;external libgstreamer;
function gst_tracing_get_active_tracers:PGList;cdecl;external libgstreamer;
function gst_tracer_class_uses_structure_params(tracer_class:PGstTracerClass):Tgboolean;cdecl;external libgstreamer;
procedure gst_tracer_class_set_use_structure_params(tracer_class:PGstTracerClass; use_structure_params:Tgboolean);cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTracer, gst_object_unref) }
{$endif}
{ __GST_TRACER_H__  }

// === Konventiert am: 11-7-26 15:32:47 ===

function GST_TYPE_TRACER : TGType;
function GST_TRACER(obj : Pointer) : PGstTracer;
function GST_TRACER_CLASS(klass : Pointer) : PGstTracerClass;
function GST_IS_TRACER(obj : Pointer) : Tgboolean;
function GST_IS_TRACER_CLASS(klass : Pointer) : Tgboolean;
function GST_TRACER_GET_CLASS(obj : Pointer) : PGstTracerClass;

implementation

function GST_TYPE_TRACER : TGType;
  begin
    GST_TYPE_TRACER:=gst_tracer_get_type;
  end;

function GST_TRACER(obj : Pointer) : PGstTracer;
begin
  Result := PGstTracer(g_type_check_instance_cast(obj, GST_TYPE_TRACER));
end;

function GST_TRACER_CLASS(klass : Pointer) : PGstTracerClass;
begin
  Result := PGstTracerClass(g_type_check_class_cast(klass, GST_TYPE_TRACER));
end;

function GST_IS_TRACER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_TRACER);
end;

function GST_IS_TRACER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_TRACER);
end;

function GST_TRACER_GET_CLASS(obj : Pointer) : PGstTracerClass;
begin
  Result := PGstTracerClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_CAST(obj : longint) : PGstTracer;
begin
  GST_TRACER_CAST:=PGstTracer(obj);
end;


end.
