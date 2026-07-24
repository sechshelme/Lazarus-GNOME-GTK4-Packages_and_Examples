
unit gstcudamemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcudamemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcudamemory
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
PCUmemAllocationProp  = ^CUmemAllocationProp;
PCUtexObject  = ^CUtexObject;
PGstCudaAllocator  = ^GstCudaAllocator;
PGstCudaAllocatorClass  = ^GstCudaAllocatorClass;
PGstCudaAllocatorPrivate  = ^GstCudaAllocatorPrivate;
PGstCudaContext  = ^GstCudaContext;
PGstCudaMemory  = ^GstCudaMemory;
PGstCudaMemoryAllocatorNeedPoolCallback  = ^GstCudaMemoryAllocatorNeedPoolCallback;
PGstCudaMemoryAllocMethod  = ^GstCudaMemoryAllocMethod;
PGstCudaMemoryPool  = ^GstCudaMemoryPool;
PGstCudaMemoryPrivate  = ^GstCudaMemoryPrivate;
PGstCudaMemoryTransfer  = ^GstCudaMemoryTransfer;
PGstCudaPoolAllocator  = ^GstCudaPoolAllocator;
PGstCudaPoolAllocatorClass  = ^GstCudaPoolAllocatorClass;
PGstCudaPoolAllocatorPrivate  = ^GstCudaPoolAllocatorPrivate;
PGstCudaStream  = ^GstCudaStream;
PGstMemory  = ^GstMemory;
PGstStructure  = ^GstStructure;
PGstVideoInfo  = ^GstVideoInfo;
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
{$include <gst/gst.h>}
{$include <gst/gstallocator.h>}
{$include <gst/video/video.h>}
{$include <gst/cuda/cuda-prelude.h>}
{$include <gst/cuda/gstcudacontext.h>}
{$include <gst/cuda/gstcudastream.h>}
{$include <gst/cuda/gstcudamemorypool.h>}

{ was #define dname def_expr }
function GST_TYPE_CUDA_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_ALLOCATOR_CLASS(klass : longint) : longint;

{*
 * GST_CUDA_ALLOCATOR_CAST:
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_ALLOCATOR_CAST(obj : longint) : PGstCudaAllocator;

{*
 * GST_CUDA_MEMORY_CAST:
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_MEMORY_CAST(mem : longint) : PGstCudaMemory;

{ was #define dname def_expr }
function GST_TYPE_CUDA_POOL_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_POOL_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_POOL_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_POOL_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_POOL_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_POOL_ALLOCATOR_CLASS(klass : longint) : longint;

type
{*
 * GST_MAP_CUDA:
 *
 * Flag indicating that we should map the CUDA device memory
 * instead of to system memory.
 *
 * Combining #GST_MAP_CUDA with #GST_MAP_WRITE has the same semantics as though
 * you are writing to CUDA device/host memory.
 * Conversely, combining #GST_MAP_CUDA with
 * #GST_MAP_READ has the same semantics as though you are reading from
 * CUDA device/host memory
 *
 * Since: 1.22
  }

const
  GST_MAP_CUDA = GST_MAP_FLAG_LAST shl 1;  
{*
 * GST_MAP_READ_CUDA: (value 131073) (type GstMapFlags)
 *
 * GstMapFlags value alias for GST_MAP_READ | GST_MAP_CUDA
 *
 * Since: 1.28
  }

{ was #define dname def_expr }
function GST_MAP_READ_CUDA : TGstMapFlags;  

{*
 * GST_MAP_WRITE_CUDA: (value 131074) (type GstMapFlags)
 *
 * GstMapFlags value alias for GST_MAP_WRITE | GST_MAP_CUDA
 *
 * Since: 1.28
  }
{ was #define dname def_expr }
function GST_MAP_WRITE_CUDA : TGstMapFlags;  

{*
 * GST_CUDA_MEMORY_TYPE_NAME:
 *
 * Name of cuda memory type
 *
 * Since: 1.22
  }
const
  GST_CUDA_MEMORY_TYPE_NAME = 'gst.cuda.memory';  
{*
 * GST_CAPS_FEATURE_MEMORY_CUDA_MEMORY:
 *
 * Name of the caps feature for indicating the use of #GstCudaMemory
 *
 * Since: 1.22
  }
  GST_CAPS_FEATURE_MEMORY_CUDA_MEMORY = 'memory:CUDAMemory';  
{*
 * GstCudaMemoryTransfer:
 *
 * CUDA memory transfer flags
  }
{*
   * GST_CUDA_MEMORY_TRANSFER_NEED_DOWNLOAD:
   *
   * the device memory needs downloading to the staging memory
   *
   * Since: 1.22
    }
{*
   * GST_CUDA_MEMORY_TRANSFER_NEED_UPLOAD:
   *
   * the staging memory needs uploading to the device memory
   *
   * Since: 1.22
    }
{*
   * GST_CUDA_MEMORY_TRANSFER_NEED_SYNC:
   *
   * the device memory needs synchronization
   *
   * Since: 1.24
    }
type
  PGstCudaMemoryTransfer = ^TGstCudaMemoryTransfer;
  TGstCudaMemoryTransfer =  Longint;
  Const
    GST_CUDA_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl 0;
    GST_CUDA_MEMORY_TRANSFER_NEED_UPLOAD = GST_MEMORY_FLAG_LAST shl 1;
    GST_CUDA_MEMORY_TRANSFER_NEED_SYNC = GST_MEMORY_FLAG_LAST shl 2;
;
{*
 * GstCudaMemoryAllocMethod:
 *
 * CUDA memory allocation method
 *
 * Since: 1.24
  }
{*
   * GST_CUDA_MEMORY_ALLOC_UNKNOWN:
   *
   * Since: 1.24
    }
{*
   * GST_CUDA_MEMORY_ALLOC_MALLOC:
   *
   * Memory allocated via cuMemAlloc or cuMemAllocPitch
   *
   * Since: 1.24
    }
{*
   * GST_CUDA_MEMORY_ALLOC_MMAP:
   *
   * Memory allocated via cuMemCreate and cuMemMap
   *
   * Since: 1.24
    }
type
  PGstCudaMemoryAllocMethod = ^TGstCudaMemoryAllocMethod;
  TGstCudaMemoryAllocMethod =  Longint;
  Const
    GST_CUDA_MEMORY_ALLOC_UNKNOWN = 0;
    GST_CUDA_MEMORY_ALLOC_MALLOC = 1;
    GST_CUDA_MEMORY_ALLOC_MMAP = 2;
;

{ was #define dname def_expr }
function GST_TYPE_CUDA_MEMORY_ALLOC_METHOD : longint; { return type might be wrong }

function gst_cuda_memory_alloc_method_get_type:TGType;cdecl;external;
{*
 * GST_CUDA_ALLOCATOR_OPT_STREAM_ORDERED:
 *
 * #G_TYPE_BOOLEAN Allows stream ordered allocation. Default is %FALSE
 *
 * Since: 1.26
  }
const
  GST_CUDA_ALLOCATOR_OPT_STREAM_ORDERED = 'GstCudaAllocator.stream-ordered';  
{*
 * GstCudaMemoryAllocatorNeedPoolCallback: (skip)
 * @allocator: a #GstCudaAllocator
 * @context: a #GstCudaContext
 * @user_data: the user data
 *
 * Called to request cuda memory pool object. If callee returns a memory pool,
 * @allocator will allocate memory via cuMemAllocFromPoolAsync.
 * Otherwise device default memory pool will be used with cuMemAllocAsync method
 *
 * Returns: (transfer full) (nullable): Configured #GstCudaMemoryPool object
 *
 * Since: 1.26
  }
type
  PGstCudaMemoryAllocatorNeedPoolCallback = ^TGstCudaMemoryAllocatorNeedPoolCallback;
  TGstCudaMemoryAllocatorNeedPoolCallback = function (allocator:PGstCudaAllocator; context:PGstCudaContext; user_data:Tgpointer):PGstCudaMemoryPool;cdecl;
{*
 * GstCudaMemory:
 *
 * Since: 1.22
  }
{< public > }
{< private > }
  PGstCudaMemory = ^TGstCudaMemory;
  TGstCudaMemory = record
      mem : TGstMemory;cdecl;
      context : PGstCudaContext;
      info : TGstVideoInfo;
      priv : PGstCudaMemoryPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_cuda_memory_init_once;cdecl;external;
function gst_is_cuda_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_cuda_memory_get_stream(mem:PGstCudaMemory):PGstCudaStream;cdecl;external;
procedure gst_cuda_memory_sync(mem:PGstCudaMemory);cdecl;external;
function gst_cuda_memory_get_texture(mem:PGstCudaMemory; plane:Tguint; filter_mode:TCUfilter_mode; texture:PCUtexObject):Tgboolean;cdecl;external;
function gst_cuda_memory_get_user_data(mem:PGstCudaMemory):Tgpointer;cdecl;external;
procedure gst_cuda_memory_set_token_data(mem:PGstCudaMemory; token:Tgint64; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gst_cuda_memory_get_token_data(mem:PGstCudaMemory; token:Tgint64):Tgpointer;cdecl;external;
function gst_cuda_memory_get_alloc_method(mem:PGstCudaMemory):TGstCudaMemoryAllocMethod;cdecl;external;
function gst_cuda_memory_export(mem:PGstCudaMemory; os_handle:Tgpointer):Tgboolean;cdecl;external;
{*
 * GstCudaAllocator:
 *
 * A #GstAllocator subclass for cuda memory
 *
 * Since: 1.22
  }
{< private > }
type
  PGstCudaAllocator = ^TGstCudaAllocator;
  TGstCudaAllocator = record
      parent : TGstAllocator;
      priv : PGstCudaAllocatorPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
   * GstCudaAllocatorClass::set_active:
   * @allocator: a #GstCudaAllocator
   * @active: the new active state
   *
   * Since: 1.24
    }
{< private > }
  PGstCudaAllocatorClass = ^TGstCudaAllocatorClass;
  TGstCudaAllocatorClass = record
      parent_class : TGstAllocatorClass;
      set_active : function (allocator:PGstCudaAllocator; active:Tgboolean):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_cuda_allocator_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_cuda_allocator_alloc(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo):PGstMemory;cdecl;external;
(* Const before type ignored *)
function gst_cuda_allocator_alloc_stream_ordered(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo):PGstMemory;cdecl;external;
function gst_cuda_allocator_set_active(allocator:PGstCudaAllocator; active:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_cuda_allocator_alloc_wrapped(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; dev_ptr:TCUdeviceptr; 
           user_data:Tgpointer; notify:TGDestroyNotify):PGstMemory;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_cuda_allocator_virtual_alloc(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; prop:PCUmemAllocationProp; 
           granularity_flags:TCUmemAllocationGranularity_flags):PGstMemory;cdecl;external;
{*
 * GstCudaPoolAllocator:
 *
 * A #GstCudaAllocator subclass for cuda memory pool
 *
 * Since: 1.24
  }
{< private > }
type
  PGstCudaPoolAllocator = ^TGstCudaPoolAllocator;
  TGstCudaPoolAllocator = record
      parent : TGstCudaAllocator;
      context : PGstCudaContext;
      stream : PGstCudaStream;
      info : TGstVideoInfo;
      priv : PGstCudaPoolAllocatorPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstCudaPoolAllocatorClass = ^TGstCudaPoolAllocatorClass;
  TGstCudaPoolAllocatorClass = record
      parent_class : TGstCudaAllocatorClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_cuda_pool_allocator_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_cuda_pool_allocator_new(context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo):PGstCudaPoolAllocator;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_cuda_pool_allocator_new_for_virtual_memory(context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; prop:PCUmemAllocationProp; granularity_flags:TCUmemAllocationGranularity_flags):PGstCudaPoolAllocator;cdecl;external;
(* Const before type ignored *)
function gst_cuda_pool_allocator_new_full(context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; config:PGstStructure):PGstCudaPoolAllocator;cdecl;external;
function gst_cuda_pool_allocator_acquire_memory(allocator:PGstCudaPoolAllocator; memory:PPGstMemory):TGstFlowReturn;cdecl;external;
procedure gst_cuda_register_allocator_need_pool_callback(callback:TGstCudaMemoryAllocatorNeedPoolCallback; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_CUDA_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_ALLOCATOR:=gst_cuda_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_ALLOCATOR(obj : longint) : longint;
begin
  GST_CUDA_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_CUDA_ALLOCATOR,GstCudaAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_CUDA_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_CUDA_ALLOCATOR,GstCudaAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_CUDA_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CUDA_ALLOCATOR,GstCudaAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_CUDA_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_CUDA_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_CUDA_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_CUDA_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_ALLOCATOR_CAST(obj : longint) : PGstCudaAllocator;
begin
  GST_CUDA_ALLOCATOR_CAST:=PGstCudaAllocator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_MEMORY_CAST(mem : longint) : PGstCudaMemory;
begin
  GST_CUDA_MEMORY_CAST:=PGstCudaMemory(mem);
end;

{ was #define dname def_expr }
function GST_TYPE_CUDA_POOL_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_POOL_ALLOCATOR:=gst_cuda_pool_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_POOL_ALLOCATOR(obj : longint) : longint;
begin
  GST_CUDA_POOL_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_CUDA_POOL_ALLOCATOR,GstCudaPoolAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_POOL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_CUDA_POOL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_CUDA_POOL_ALLOCATOR,GstCudaPoolAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CUDA_POOL_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_CUDA_POOL_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CUDA_POOL_ALLOCATOR,GstCudaPoolAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_POOL_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_CUDA_POOL_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_CUDA_POOL_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_POOL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_CUDA_POOL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_CUDA_POOL_ALLOCATOR);
end;

{ was #define dname def_expr }
function GST_MAP_READ_CUDA : TGstMapFlags;
  begin
    GST_MAP_READ_CUDA:=TGstMapFlags(GST_MAP_READ or GST_MAP_CUDA);
  end;

{ was #define dname def_expr }
function GST_MAP_WRITE_CUDA : TGstMapFlags;
  begin
    GST_MAP_WRITE_CUDA:=TGstMapFlags(GST_MAP_WRITE or GST_MAP_CUDA);
  end;

{ was #define dname def_expr }
function GST_TYPE_CUDA_MEMORY_ALLOC_METHOD : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_MEMORY_ALLOC_METHOD:=gst_cuda_memory_alloc_method_get_type;
  end;


end.
