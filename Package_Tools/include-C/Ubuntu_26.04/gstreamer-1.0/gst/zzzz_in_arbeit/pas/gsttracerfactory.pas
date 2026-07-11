unit gsttracerfactory;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2013 Stefan Sauer <ensonic@users.sf.net>
 *
 * gsttracerfactory.h: tracing subsystem
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
{$ifndef __GST_TRACER_FACTORY_H__}
{$define __GST_TRACER_FACTORY_H__}
{$include <gst/gstcaps.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}

{ was #define dname def_expr }
function GST_TYPE_TRACER_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_FACTORY_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_FACTORY_CAST(obj : longint) : PGstTracerFactory;

{*
 * GstTracerFactory:
 *
 * Opaque object that stores information about a tracer function.
 *
 * Since: 1.8
  }
type
{ tracering interface  }

function gst_tracer_factory_get_type:TGType;cdecl;external libgstreamer;
function gst_tracer_factory_get_list:PGList;cdecl;external libgstreamer;
function gst_tracer_factory_get_tracer_type(factory:PGstTracerFactory):TGType;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTracerFactory, gst_object_unref) }
{$endif}
{ __GST_TRACER_FACTORY_H__  }

// === Konventiert am: 11-7-26 15:54:58 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_TRACER_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_TRACER_FACTORY:=gst_tracer_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_FACTORY(obj : longint) : longint;
begin
  GST_TRACER_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TRACER_FACTORY,GstTracerFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_FACTORY(obj : longint) : longint;
begin
  GST_IS_TRACER_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TRACER_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_TRACER_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_TRACER_FACTORY,GstTracerFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_TRACER_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_TRACER_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_FACTORY_GET_CLASS(obj : longint) : longint;
begin
  GST_TRACER_FACTORY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_TRACER_FACTORY,GstTracerFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_FACTORY_CAST(obj : longint) : PGstTracerFactory;
begin
  GST_TRACER_FACTORY_CAST:=PGstTracerFactory(obj);
end;


end.
