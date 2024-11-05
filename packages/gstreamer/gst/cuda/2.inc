/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   16:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


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
 * GST_CUDA_MEMORY_TYPE_NAME:
 *
 * Name of cuda memory type
 *
 * Since: 1.22
  }
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
    GST_CUDA_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl &;
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

function gst_cuda_memory_alloc_method_get_type:TGType;cdecl;external libgstcuda;
{*
 * GstCudaMemory:
 *
 * Since: 1.22
  }
{< public > }
{< private > }
type
  PGstCudaMemory = ^TGstCudaMemory;
  TGstCudaMemory = record
      mem : TGstMemory;
      context : PGstCudaContext;
      info : TGstVideoInfo;
      priv : PGstCudaMemoryPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_cuda_memory_init_once;cdecl;external libgstcuda;
function gst_is_cuda_memory(mem:PGstMemory):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_memory_get_stream(mem:PGstCudaMemory):PGstCudaStream;cdecl;external libgstcuda;
procedure gst_cuda_memory_sync(mem:PGstCudaMemory);cdecl;external libgstcuda;
function gst_cuda_memory_get_texture(mem:PGstCudaMemory; plane:Tguint; filter_mode:TCUfilter_mode; texture:PCUtexObject):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_memory_get_user_data(mem:PGstCudaMemory):Tgpointer;cdecl;external libgstcuda;
procedure gst_cuda_memory_set_token_data(mem:PGstCudaMemory; token:Tgint64; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstcuda;
function gst_cuda_memory_get_token_data(mem:PGstCudaMemory; token:Tgint64):Tgpointer;cdecl;external libgstcuda;
function gst_cuda_memory_get_alloc_method(mem:PGstCudaMemory):TGstCudaMemoryAllocMethod;cdecl;external libgstcuda;
function gst_cuda_memory_export(mem:PGstCudaMemory; os_handle:Tgpointer):Tgboolean;cdecl;external libgstcuda;
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


function gst_cuda_allocator_get_type:TGType;cdecl;external libgstcuda;
function gst_cuda_allocator_alloc(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo):PGstMemory;cdecl;external libgstcuda;
function gst_cuda_allocator_set_active(allocator:PGstCudaAllocator; active:Tgboolean):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_allocator_alloc_wrapped(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; dev_ptr:TCUdeviceptr; 
           user_data:Tgpointer; notify:TGDestroyNotify):PGstMemory;cdecl;external libgstcuda;
function gst_cuda_allocator_virtual_alloc(allocator:PGstCudaAllocator; context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; prop:PCUmemAllocationProp; 
           granularity_flags:TCUmemAllocationGranularity_flags):PGstMemory;cdecl;external libgstcuda;
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


function gst_cuda_pool_allocator_get_type:TGType;cdecl;external libgstcuda;
function gst_cuda_pool_allocator_new(context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo):PGstCudaPoolAllocator;cdecl;external libgstcuda;
function gst_cuda_pool_allocator_new_for_virtual_memory(context:PGstCudaContext; stream:PGstCudaStream; info:PGstVideoInfo; prop:PCUmemAllocationProp; granularity_flags:TCUmemAllocationGranularity_flags):PGstCudaPoolAllocator;cdecl;external libgstcuda;
function gst_cuda_pool_allocator_acquire_memory(allocator:PGstCudaPoolAllocator; memory:PPGstMemory):TGstFlowReturn;cdecl;external libgstcuda;

// === Konventiert am: 11-10-24 15:01:43 ===

function GST_TYPE_CUDA_POOL_ALLOCATOR : TGType;
function GST_CUDA_POOL_ALLOCATOR(obj : Pointer) : PGstCudaPoolAllocator;
function GST_CUDA_POOL_ALLOCATOR_CLASS(klass : Pointer) : PGstCudaPoolAllocatorClass;
function GST_CUDA_POOL_ALLOCATOR_GET_CLASS(obj : Pointer) : Tgboolean;
function GST_IS_CUDA_POOL_ALLOCATOR(obj : Tgboolean) : longint;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CUDA_POOL_ALLOCATOR : TGType;
  begin
    GST_TYPE_CUDA_POOL_ALLOCATOR:=gst_cuda_pool_allocator_get_type;
  end;

function GST_CUDA_POOL_ALLOCATOR(obj : Pointer) : PGstCudaPoolAllocator;
begin
  Result := PGstCudaPoolAllocator(g_type_check_instance_cast(obj, GST_TYPE_CUDA_POOL_ALLOCATOR));
end;

function GST_CUDA_POOL_ALLOCATOR_CLASS(klass : Pointer) : PGstCudaPoolAllocatorClass;
begin
  Result := PGstCudaPoolAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_POOL_ALLOCATOR));
end;

function GST_CUDA_POOL_ALLOCATOR_GET_CLASS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_CUDA_POOL_ALLOCATOR);
end;

function GST_IS_CUDA_POOL_ALLOCATOR(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_CUDA_POOL_ALLOCATOR);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CUDA_POOL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_CUDA_POOL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_CUDA_POOL_ALLOCATOR);
end;

{ was #define dname def_expr }
function GST_TYPE_CUDA_MEMORY_ALLOC_METHOD : longint; { return type might be wrong }
  begin
    GST_TYPE_CUDA_MEMORY_ALLOC_METHOD:=gst_cuda_memory_alloc_method_get_type;
  end;


{$ENDIF read_implementation}
