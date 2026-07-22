
unit gsthipevent;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthipevent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthipevent.h
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
PGstHipEvent  = ^GstHipEvent;
PGstHipEventPool  = ^GstHipEventPool;
PGstHipEventPoolClass  = ^GstHipEventPoolClass;
PGstHipEventPoolPrivate  = ^GstHipEventPoolPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2025 Seungha Yang <seungha@centricular.com>
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
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/hip/gsthip_fwd.h>}
{$include <gst/hip/gsthip-enums.h>}

{ was #define dname def_expr }
function GST_TYPE_HIP_EVENT_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_EVENT_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_EVENT_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_EVENT_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_EVENT_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_EVENT_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_EVENT_POOL_CAST(obj : longint) : PGstHipEventPool;

{*
 * GstHipEventPool:
 *
 * Opaque GstHipEventPool struct
 *
 * Since: 1.28
  }
{< private > }
type
  PGstHipEventPool = ^TGstHipEventPool;
  TGstHipEventPool = record
      parent : TGstObject;
      priv : PGstHipEventPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstHipEventPoolClass:
 *
 * Opaque GstHipEventPoolClass struct
 *
 * Since: 1.28
  }
{< private > }
  PGstHipEventPoolClass = ^TGstHipEventPoolClass;
  TGstHipEventPoolClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_hip_event_pool_get_type:TGType;cdecl;external;
function gst_hip_event_get_type:TGType;cdecl;external;
function gst_hip_event_pool_new(vendor:TGstHipVendor; device_id:Tguint):PGstHipEventPool;cdecl;external;
function gst_hip_event_pool_acquire(pool:PGstHipEventPool; event:PPGstHipEvent):Tgboolean;cdecl;external;
function gst_hip_event_get_vendor(event:PGstHipEvent):TGstHipVendor;cdecl;external;
function gst_hip_event_get_device_id(event:PGstHipEvent):Tguint;cdecl;external;
function gst_hip_event_record(event:PGstHipEvent; stream:ThipStream_t):ThipError_t;cdecl;external;
function gst_hip_event_query(event:PGstHipEvent):ThipError_t;cdecl;external;
function gst_hip_event_synchronize(event:PGstHipEvent):ThipError_t;cdecl;external;
function gst_hip_event_ref(event:PGstHipEvent):PGstHipEvent;cdecl;external;
procedure gst_hip_event_unref(event:PGstHipEvent);cdecl;external;
procedure gst_clear_hip_event(event:PPGstHipEvent);cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_HIP_EVENT_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_HIP_EVENT_POOL:=gst_hip_event_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_EVENT_POOL(obj : longint) : longint;
begin
  GST_HIP_EVENT_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_HIP_EVENT_POOL,GstHipEventPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_EVENT_POOL_CLASS(klass : longint) : longint;
begin
  GST_HIP_EVENT_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_HIP_EVENT_POOL,GstHipEventPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_EVENT_POOL(obj : longint) : longint;
begin
  GST_IS_HIP_EVENT_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_HIP_EVENT_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_EVENT_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_HIP_EVENT_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_HIP_EVENT_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_EVENT_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_HIP_EVENT_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_HIP_EVENT_POOL,GstHipEventPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_EVENT_POOL_CAST(obj : longint) : PGstHipEventPool;
begin
  GST_HIP_EVENT_POOL_CAST:=PGstHipEventPool(obj);
end;


end.
