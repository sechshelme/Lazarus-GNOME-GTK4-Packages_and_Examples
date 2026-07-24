
unit gstcudamemorypool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcudamemorypool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcudamemorypool.h
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
PCUmemPoolProps  = ^CUmemPoolProps;
PGstCudaContext  = ^GstCudaContext;
PGstCudaMemoryPool  = ^GstCudaMemoryPool;
PGstCudaMemoryPoolPrivate  = ^GstCudaMemoryPoolPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2024 Seungha Yang <seungha@centricular.com>
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
{$include <gst/cuda/cuda-prelude.h>}
{$include <gst/cuda/gstcudacontext.h>}
{$include <cuda.h>}

{ was #define dname def_expr }
function GST_TYPE_CUDA_MEMORY_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_MEMORY_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_MEMORY_POOL(obj : longint) : PGstCudaMemoryPool;

type
{*
 * GstCudaMemoryPool:
 *
 * Since: 1.26
  }
{< private > }
  PGstCudaMemoryPool = ^TGstCudaMemoryPool;
  TGstCudaMemoryPool = record
      parent : TGstMiniObject;
      context : PGstCudaContext;
      priv : PGstCudaMemoryPoolPrivate;
    end;


function gst_cuda_memory_pool_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_cuda_memory_pool_new(context:PGstCudaContext; props:PCUmemPoolProps):PGstCudaMemoryPool;cdecl;external;
function gst_cuda_memory_pool_get_handle(pool:PGstCudaMemoryPool):TCUmemoryPool;cdecl;external;
function gst_cuda_memory_pool_ref(pool:PGstCudaMemoryPool):PGstCudaMemoryPool;cdecl;external;
procedure gst_cuda_memory_pool_unref(pool:PGstCudaMemoryPool);cdecl;external;
procedure gst_clear_cuda_memory_pool(pool:PPGstCudaMemoryPool);cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_CUDA_MEMORY_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_MEMORY_POOL:=gst_cuda_memory_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_MEMORY_POOL(obj : longint) : longint;
begin
  GST_IS_CUDA_MEMORY_POOL:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_CUDA_MEMORY_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_MEMORY_POOL(obj : longint) : PGstCudaMemoryPool;
begin
  GST_CUDA_MEMORY_POOL:=PGstCudaMemoryPool(obj);
end;


end.
