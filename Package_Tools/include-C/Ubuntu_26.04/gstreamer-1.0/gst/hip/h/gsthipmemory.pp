
unit gsthipmemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthipmemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthipmemory.h
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
PGstHipAllocator  = ^GstHipAllocator;
PGstHipAllocatorClass  = ^GstHipAllocatorClass;
PGstHipAllocatorPrivate  = ^GstHipAllocatorPrivate;
PGstHipDevice  = ^GstHipDevice;
PGstHipEvent  = ^GstHipEvent;
PGstHipMemory  = ^GstHipMemory;
PGstHipMemoryPrivate  = ^GstHipMemoryPrivate;
PGstHipMemoryTransfer  = ^GstHipMemoryTransfer;
PGstHipPoolAllocator  = ^GstHipPoolAllocator;
PGstHipPoolAllocatorClass  = ^GstHipPoolAllocatorClass;
PGstHipPoolAllocatorPrivate  = ^GstHipPoolAllocatorPrivate;
PGstHipStream  = ^GstHipStream;
PGstMemory  = ^GstMemory;
PGstVideoInfo  = ^GstVideoInfo;
PhipTextureObject_t  = ^hipTextureObject_t;
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
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_HIP_MEMORY_CAST(obj : longint) : PGstHipMemory;

{ was #define dname def_expr }
function GST_TYPE_HIP_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_ALLOCATOR_CAST(obj : longint) : PGstHipAllocator;

{ was #define dname def_expr }
function GST_TYPE_HIP_POOL_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_POOL_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_POOL_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_POOL_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_POOL_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_POOL_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_POOL_ALLOCATOR_CAST(obj : longint) : PGstHipPoolAllocator;

const
  GST_HIP_MEMORY_NAME = 'HIPMemory';  
  GST_CAPS_FEATURE_MEMORY_HIP_MEMORY = 'memory:HIPMemory';  

{ was #define dname def_expr }
function GST_MAP_HIP : TGstMapFlags;  

{ was #define dname def_expr }
function GST_MAP_READ_HIP : TGstMapFlags;  

{ was #define dname def_expr }
function GST_MAP_WRITE_HIP : TGstMapFlags;  

type
  PGstHipMemoryTransfer = ^TGstHipMemoryTransfer;
  TGstHipMemoryTransfer =  Longint;
  Const
    GST_HIP_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl 0;
    GST_HIP_MEMORY_TRANSFER_NEED_UPLOAD = GST_MEMORY_FLAG_LAST shl 1;
;
{*
 * GstHipMemory:
 *
 * Opaque GstHipMemory struct
 *
 * Since: 1.28
  }
{< public > }
{< private > }
type
  PGstHipMemory = ^TGstHipMemory;
  TGstHipMemory = record
      mem : TGstMemory;
      device : PGstHipDevice;
      info : TGstVideoInfo;
      priv : PGstHipMemoryPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_is_hip_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_hip_memory_get_texture(mem:PGstHipMemory; plane:Tguint; filter_mode:THIPfilter_mode; address_mode:THIPaddress_mode; texture:PhipTextureObject_t):Tgboolean;cdecl;external;
function gst_hip_memory_get_stream(mem:PGstHipMemory):PGstHipStream;cdecl;external;
procedure gst_hip_memory_set_event(mem:PGstHipMemory; event:PGstHipEvent);cdecl;external;
procedure gst_hip_memory_sync(mem:PGstHipMemory);cdecl;external;
{*
 * GstHipAllocator:
 *
 * Opaque GstHipAllocator struct
 *
 * Since: 1.28
  }
{< private > }
type
  PGstHipAllocator = ^TGstHipAllocator;
  TGstHipAllocator = record
      allocator : TGstAllocator;
      priv : PGstHipAllocatorPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstHipAllocatorClass:
 *
 * Opaque GstHipAllocatorClass struct
 *
 * Since: 1.28
  }
{< private > }
  PGstHipAllocatorClass = ^TGstHipAllocatorClass;
  TGstHipAllocatorClass = record
      allocator_class : TGstAllocatorClass;
      set_active : function (allocator:PGstHipAllocator; active:Tgboolean):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_hip_allocator_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_hip_allocator_alloc(allocator:PGstHipAllocator; device:PGstHipDevice; info:PGstVideoInfo):PGstMemory;cdecl;external;
function gst_hip_allocator_set_active(allocator:PGstHipAllocator; active:Tgboolean):Tgboolean;cdecl;external;
{*
 * GstHipPoolAllocator:
 *
 * Opaque GstHipPoolAllocator struct
 *
 * Since: 1.28
  }
{< private > }
type
  PGstHipPoolAllocator = ^TGstHipPoolAllocator;
  TGstHipPoolAllocator = record
      parent : TGstHipAllocator;
      device : PGstHipDevice;
      info : TGstVideoInfo;
      priv : PGstHipPoolAllocatorPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstHipPoolAllocatorClass:
 *
 * Opaque GstHipPoolAllocatorClass struct
 *
 * Since: 1.28
  }
{< private > }
  PGstHipPoolAllocatorClass = ^TGstHipPoolAllocatorClass;
  TGstHipPoolAllocatorClass = record
      parent_class : TGstHipAllocatorClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_hip_pool_allocator_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_hip_pool_allocator_new(device:PGstHipDevice; info:PGstVideoInfo):PGstHipPoolAllocator;cdecl;external;
function gst_hip_pool_allocator_acquire_memory(allocator:PGstHipPoolAllocator; memory:PPGstMemory):TGstFlowReturn;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_MEMORY_CAST(obj : longint) : PGstHipMemory;
begin
  GST_HIP_MEMORY_CAST:=PGstHipMemory(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_HIP_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_HIP_ALLOCATOR:=gst_hip_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_ALLOCATOR(obj : longint) : longint;
begin
  GST_HIP_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_HIP_ALLOCATOR,GstHipAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_HIP_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_HIP_ALLOCATOR,GstHipAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_HIP_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_HIP_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_HIP_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_HIP_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_HIP_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_HIP_ALLOCATOR,GstHipAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_ALLOCATOR_CAST(obj : longint) : PGstHipAllocator;
begin
  GST_HIP_ALLOCATOR_CAST:=PGstHipAllocator(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_HIP_POOL_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_HIP_POOL_ALLOCATOR:=gst_hip_pool_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_POOL_ALLOCATOR(obj : longint) : longint;
begin
  GST_HIP_POOL_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_HIP_POOL_ALLOCATOR,GstHipPoolAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_POOL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_HIP_POOL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_HIP_POOL_ALLOCATOR,GstHipPoolAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_POOL_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_HIP_POOL_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_HIP_POOL_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_POOL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_HIP_POOL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_HIP_POOL_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_POOL_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_HIP_POOL_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_HIP_POOL_ALLOCATOR,GstHipPoolAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_HIP_POOL_ALLOCATOR_CAST(obj : longint) : PGstHipPoolAllocator;
begin
  GST_HIP_POOL_ALLOCATOR_CAST:=PGstHipPoolAllocator(obj);
end;

{ was #define dname def_expr }
function GST_MAP_HIP : TGstMapFlags;
  begin
    GST_MAP_HIP:=TGstMapFlags(GST_MAP_FLAG_LAST shl 1);
  end;

{ was #define dname def_expr }
function GST_MAP_READ_HIP : TGstMapFlags;
  begin
    GST_MAP_READ_HIP:=TGstMapFlags(GST_MAP_READ or GST_MAP_HIP);
  end;

{ was #define dname def_expr }
function GST_MAP_WRITE_HIP : TGstMapFlags;
  begin
    GST_MAP_WRITE_HIP:=TGstMapFlags(GST_MAP_WRITE or GST_MAP_HIP);
  end;


end.
