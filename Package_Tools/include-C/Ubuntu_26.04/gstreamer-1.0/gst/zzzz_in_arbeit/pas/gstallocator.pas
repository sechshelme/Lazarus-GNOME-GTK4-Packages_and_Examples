unit gstallocator;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009 Wim Taymans <wim.taymans@gmail.be>
 *
 * gstallocator.h: Header for memory allocation
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
{$ifndef __GST_ALLOCATOR_H__}
{$define __GST_ALLOCATOR_H__}
{$include <gst/gstmemory.h>}
{$include <gst/gstobject.h>}
type

{ was #define dname def_expr }
function GST_TYPE_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ALLOCATOR_CAST(obj : longint) : PGstAllocator;

{ was #define dname def_expr }
function GST_TYPE_ALLOCATION_PARAMS : longint; { return type might be wrong }

function gst_allocation_params_get_type:TGType;cdecl;external libgstreamer;
type
{*
 * gst_memory_alignment:
 *
 * The default memory alignment in bytes - 1
 * an alignment of 7 would be the same as what malloc() guarantees.
  }
  var
    gst_memory_alignment : Tgsize;cvar;external libgstreamer;
{*
 * GST_ALLOCATOR_SYSMEM:
 *
 * The allocator name for the default system memory allocator
  }

const
  GST_ALLOCATOR_SYSMEM = 'SystemMemory';  
{*
 * GstAllocationParams:
 * @flags: flags to control allocation
 * @align: the desired alignment of the memory
 * @prefix: the desired prefix
 * @padding: the desired padding
 *
 * Parameters to control the allocation of memory
  }
{< private > }
type
  PGstAllocationParams = ^TGstAllocationParams;
  TGstAllocationParams = record
      flags : TGstMemoryFlags;
      align : Tgsize;
      prefix : Tgsize;
      padding : Tgsize;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAllocatorFlags:
 * @GST_ALLOCATOR_FLAG_CUSTOM_ALLOC: The allocator has a custom alloc function.
 *    Only elements designed to work with this allocator should be using it,
 *    other elements should ignore it from allocation propositions.
 *    This implies %GST_ALLOCATOR_FLAG_NO_COPY.
 * @GST_ALLOCATOR_FLAG_NO_COPY: When copying a #GstMemory allocated with this
 *    allocator, the copy will instead be allocated using the default allocator.
 *    Use this when allocating a new memory is an heavy opperation that should
 *    only be done with a #GstBufferPool for example. (Since: 1.24)
 * @GST_ALLOCATOR_FLAG_LAST: first flag that can be used for custom purposes
 *
 * Flags for allocators.
  }
{*
 * GST_ALLOCATOR_FLAG_NO_COPY:
 *
 * When copying a #GstMemory allocated with this allocator, the copy will
 * instead be allocated using the default allocator. Use this when allocating a
 * new memory is an heavy opperation that should only be done with a
 * #GstBufferPool for example.
 *
 * Since: 1.24
  }

  PGstAllocatorFlags = ^TGstAllocatorFlags;
  TGstAllocatorFlags =  Longint;
  Const
    GST_ALLOCATOR_FLAG_CUSTOM_ALLOC = GST_OBJECT_FLAG_LAST shl 0;
    GST_ALLOCATOR_FLAG_NO_COPY = GST_OBJECT_FLAG_LAST shl 1;
    GST_ALLOCATOR_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 16;
;
{*
 * GstAllocator:
 * @mem_map: the implementation of the GstMemoryMapFunction
 * @mem_unmap: the implementation of the GstMemoryUnmapFunction
 * @mem_copy: the implementation of the GstMemoryCopyFunction
 * @mem_share: the implementation of the GstMemoryShareFunction
 * @mem_is_span: the implementation of the GstMemoryIsSpanFunction
 * @mem_map_full: the implementation of the GstMemoryMapFullFunction.
 *      Will be used instead of @mem_map if present. (Since: 1.6)
 * @mem_unmap_full: the implementation of the GstMemoryUnmapFullFunction.
 *      Will be used instead of @mem_unmap if present. (Since: 1.6)
 *
 * The #GstAllocator is used to create new memory.
  }
{< public > }
{< private > }
type
  PGstAllocator = ^TGstAllocator;
  TGstAllocator = record
      object : TGstObject;
      mem_type : Pgchar;
      mem_map : TGstMemoryMapFunction;
      mem_unmap : TGstMemoryUnmapFunction;
      mem_copy : TGstMemoryCopyFunction;
      mem_share : TGstMemoryShareFunction;
      mem_is_span : TGstMemoryIsSpanFunction;
      mem_map_full : TGstMemoryMapFullFunction;
      mem_unmap_full : TGstMemoryUnmapFullFunction;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
      priv : PGstAllocatorPrivate;
    end;

{*
 * GstAllocatorClass:
 * @object_class:  Object parent class
 * @alloc: implementation that acquires memory
 * @free: implementation that releases memory
 *
 * The #GstAllocator is used to create new memory.
  }
{< public > }
{< private > }
  PGstAllocatorClass = ^TGstAllocatorClass;
  TGstAllocatorClass = record
      object_class : TGstObjectClass;
      alloc : function (allocator:PGstAllocator; size:Tgsize; params:PGstAllocationParams):PGstMemory;cdecl;
      free : procedure (allocator:PGstAllocator; memory:PGstMemory);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_allocator_get_type:TGType;cdecl;external libgstreamer;
{ allocators  }
procedure gst_allocator_register(name:Pgchar; allocator:PGstAllocator);cdecl;external libgstreamer;
function gst_allocator_find(name:Pgchar):PGstAllocator;cdecl;external libgstreamer;
procedure gst_allocator_set_default(allocator:PGstAllocator);cdecl;external libgstreamer;
{ allocation parameters  }
function gst_allocation_params_new:PGstAllocationParams;cdecl;external libgstreamer;
procedure gst_allocation_params_init(params:PGstAllocationParams);cdecl;external libgstreamer;
function gst_allocation_params_copy(params:PGstAllocationParams):PGstAllocationParams;cdecl;external libgstreamer;
procedure gst_allocation_params_free(params:PGstAllocationParams);cdecl;external libgstreamer;
{ allocating memory blocks  }
function gst_allocator_alloc(allocator:PGstAllocator; size:Tgsize; params:PGstAllocationParams):PGstMemory;cdecl;external libgstreamer;
procedure gst_allocator_free(allocator:PGstAllocator; memory:PGstMemory);cdecl;external libgstreamer;
function gst_memory_new_wrapped(flags:TGstMemoryFlags; data:Tgpointer; maxsize:Tgsize; offset:Tgsize; size:Tgsize; 
           user_data:Tgpointer; notify:TGDestroyNotify):PGstMemory;cdecl;external libgstreamer;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (GstAllocationParams, gst_allocation_params_free) }
{$endif}
{ __GST_ALLOCATOR_H__  }

// === Konventiert am: 10-7-26 19:47:52 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_ALLOCATOR:=gst_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_ALLOCATOR,GstAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ALLOCATOR(obj : longint) : longint;
begin
  GST_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ALLOCATOR,GstAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_ALLOCATOR,GstAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ALLOCATOR_CAST(obj : longint) : PGstAllocator;
begin
  GST_ALLOCATOR_CAST:=PGstAllocator(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_ALLOCATION_PARAMS : longint; { return type might be wrong }
  begin
    GST_TYPE_ALLOCATION_PARAMS:=gst_allocation_params_get_type;
  end;


end.
