
unit gstcudabufferpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcudabufferpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcudabufferpool.h
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
Pgboolean  = ^gboolean;
PGstBufferPool  = ^GstBufferPool;
PGstCudaBufferPool  = ^GstCudaBufferPool;
PGstCudaBufferPoolClass  = ^GstCudaBufferPoolClass;
PGstCudaBufferPoolPrivate  = ^GstCudaBufferPoolPrivate;
PGstCudaContext  = ^GstCudaContext;
PGstCudaStream  = ^GstCudaStream;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2018-2019> Seungha Yang <seungha.yang@navercorp.com>
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
{$include <gst/video/video.h>}
{$include <gst/cuda/cuda-prelude.h>}
{$include <gst/cuda/gstcudamemory.h>}
{$include <gst/cuda/gstcudastream.h>}

{ was #define dname def_expr }
function GST_TYPE_CUDA_BUFFER_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_BUFFER_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_BUFFER_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_BUFFER_POOL_CLASS(klass : longint) : longint;

{*
 * GST_CUDA_BUFFER_POOL_CAST:
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_BUFFER_POOL_CAST(obj : longint) : PGstCudaBufferPool;

type
{*
 * GstCudaBufferPool:
 *
 * Since: 1.22
  }
  PGstCudaBufferPool = ^TGstCudaBufferPool;
  TGstCudaBufferPool = record
      parent : TGstBufferPool;
      context : PGstCudaContext;
      priv : PGstCudaBufferPoolPrivate;
    end;

{
 * GstCudaBufferPoolClass:
  }
  PGstCudaBufferPoolClass = ^TGstCudaBufferPoolClass;
  TGstCudaBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
    end;


function gst_cuda_buffer_pool_get_type:TGType;cdecl;external;
function gst_cuda_buffer_pool_new(context:PGstCudaContext):PGstBufferPool;cdecl;external;
function gst_buffer_pool_config_get_cuda_stream(config:PGstStructure):PGstCudaStream;cdecl;external;
procedure gst_buffer_pool_config_set_cuda_stream(config:PGstStructure; stream:PGstCudaStream);cdecl;external;
function gst_buffer_pool_config_get_cuda_alloc_method(config:PGstStructure):TGstCudaMemoryAllocMethod;cdecl;external;
procedure gst_buffer_pool_config_set_cuda_alloc_method(config:PGstStructure; method:TGstCudaMemoryAllocMethod);cdecl;external;
function gst_buffer_pool_config_get_cuda_stream_ordered_alloc(config:PGstStructure; enabled:Pgboolean):Tgboolean;cdecl;external;
procedure gst_buffer_pool_config_set_cuda_stream_ordered_alloc(config:PGstStructure; stream_ordered:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_CUDA_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_BUFFER_POOL:=gst_cuda_buffer_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_BUFFER_POOL(obj : longint) : longint;
begin
  GST_CUDA_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_CUDA_BUFFER_POOL,GstCudaBufferPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_BUFFER_POOL_CLASS(klass : longint) : longint;
begin
  GST_CUDA_BUFFER_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_CUDA_BUFFER_POOL,GstCudaBufferPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_BUFFER_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_CUDA_BUFFER_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CUDA_BUFFER_POOL,GstCudaBufferPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_BUFFER_POOL(obj : longint) : longint;
begin
  GST_IS_CUDA_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_CUDA_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_BUFFER_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_CUDA_BUFFER_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_CUDA_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_BUFFER_POOL_CAST(obj : longint) : PGstCudaBufferPool;
begin
  GST_CUDA_BUFFER_POOL_CAST:=PGstCudaBufferPool(obj);
end;


end.
