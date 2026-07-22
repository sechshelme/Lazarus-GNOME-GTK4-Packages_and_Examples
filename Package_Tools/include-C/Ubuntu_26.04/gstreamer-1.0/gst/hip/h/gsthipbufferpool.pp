
unit gsthipbufferpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthipbufferpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthipbufferpool.h
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
PGstBufferPool  = ^GstBufferPool;
PGstHipBufferPool  = ^GstHipBufferPool;
PGstHipBufferPoolClass  = ^GstHipBufferPoolClass;
PGstHipBufferPoolPrivate  = ^GstHipBufferPoolPrivate;
PGstHipDevice  = ^GstHipDevice;
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
{$include <gst/video/video.h>}
{$include <gst/hip/gsthip_fwd.h>}

{ was #define dname def_expr }
function GST_TYPE_HIP_BUFFER_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_BUFFER_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_BUFFER_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_BUFFER_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_BUFFER_POOL_CAST(obj : longint) : PGstHipBufferPool;

{*
 * GstHipBufferPool:
 *
 * Opaque GstHipBufferPool struct
 *
 * Since: 1.28
  }
{< private > }
type
  PGstHipBufferPool = ^TGstHipBufferPool;
  TGstHipBufferPool = record
      parent : TGstBufferPool;
      device : PGstHipDevice;
      priv : PGstHipBufferPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstHipBufferPoolClass:
 *
 * Opaque GstHipBufferPoolClass struct
 *
 * Since: 1.28
  }
{< private > }
  PGstHipBufferPoolClass = ^TGstHipBufferPoolClass;
  TGstHipBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_hip_buffer_pool_get_type:TGType;cdecl;external;
function gst_hip_buffer_pool_new(device:PGstHipDevice):PGstBufferPool;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_HIP_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_HIP_BUFFER_POOL:=gst_hip_buffer_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_BUFFER_POOL(obj : longint) : longint;
begin
  GST_HIP_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_HIP_BUFFER_POOL,GstHipBufferPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_BUFFER_POOL_CLASS(klass : longint) : longint;
begin
  GST_HIP_BUFFER_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_HIP_BUFFER_POOL,GstHipBufferPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_BUFFER_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_HIP_BUFFER_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_HIP_BUFFER_POOL,GstHipBufferPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_BUFFER_POOL(obj : longint) : longint;
begin
  GST_IS_HIP_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_HIP_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_BUFFER_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_HIP_BUFFER_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_HIP_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_BUFFER_POOL_CAST(obj : longint) : PGstHipBufferPool;
begin
  GST_HIP_BUFFER_POOL_CAST:=PGstHipBufferPool(obj);
end;


end.
