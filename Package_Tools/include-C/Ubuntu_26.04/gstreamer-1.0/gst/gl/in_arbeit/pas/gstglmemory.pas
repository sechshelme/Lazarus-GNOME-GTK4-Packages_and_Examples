unit gstglmemory;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef _GST_GL_MEMORY_H_}
{$define _GST_GL_MEMORY_H_}
{$include <gst/gl/gstglbasememory.h>}
{$include <gst/gl/gstglformat.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_ALLOCATOR : longint; { return type might be wrong }

function gst_gl_memory_allocator_get_type:TGType;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstGLMemoryAllocator;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_CAST(obj : longint) : PGstGLMemory;

{*
 * GST_CAPS_FEATURE_MEMORY_GL_MEMORY:
 *
 * Name of the caps feature for indicating the use of #GstGLMemory
  }
const
  GST_CAPS_FEATURE_MEMORY_GL_MEMORY = 'memory:GLMemory';  
{*
 * GST_GL_MEMORY_VIDEO_EXT_FORMATS: (skip)
  }
{< protected > }
{< private > }
type
  PGstGLMemory = ^TGstGLMemory;
  TGstGLMemory = record
      mem : TGstGLBaseMemory;
      tex_id : Tguint;
      tex_target : TGstGLTextureTarget;
      tex_format : TGstGLFormat;
      info : TGstVideoInfo;
      valign : TGstVideoAlignment;
      plane : Tguint;
      tex_scaling : array[0..1] of Tgfloat;
      texture_wrapped : Tgboolean;
      unpack_length : Tguint;
      tex_width : Tguint;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


{ was #define dname def_expr }
function GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS : longint; { return type might be wrong }

function gst_gl_video_allocation_params_get_type:TGType;cdecl;external libgstgl;
type
{*
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO:
 *
 * GL allocation flag indicating the allocation of 2D video frames
  }

const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO = 1 shl 3;  
{*
 * GstGLVideoAllocationParams:
 * @parent: the parent #GstGLAllocationParams structure
 * @v_info: the #GstVideoInfo to allocate
 * @plane: the video plane index to allocate
 * @valign: the #GstVideoAlignment to align the system representation to (may be %NULL for the default)
 * @target: the #GstGLTextureTarget to allocate
 * @tex_format: the #GstGLFormat to allocate
  }
{< private > }
type
  PGstGLVideoAllocationParams = ^TGstGLVideoAllocationParams;
  TGstGLVideoAllocationParams = record
      parent : TGstGLAllocationParams;
      v_info : PGstVideoInfo;
      plane : Tguint;
      valign : PGstVideoAlignment;
      target : TGstGLTextureTarget;
      tex_format : TGstGLFormat;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_video_allocation_params_init_full(params:PGstGLVideoAllocationParams; struct_size:Tgsize; alloc_flags:Tguint; copy:TGstGLAllocationParamsCopyFunc; free:TGstGLAllocationParamsFreeFunc; 
           context:PGstGLContext; alloc_params:PGstAllocationParams; v_info:PGstVideoInfo; plane:Tguint; valign:PGstVideoAlignment; 
           target:TGstGLTextureTarget; tex_format:TGstGLFormat; wrapped_data:Tgpointer; gl_handle:Tgpointer; user_data:Tgpointer; 
           notify:TGDestroyNotify):Tgboolean;cdecl;external libgstgl;
function gst_gl_video_allocation_params_new(context:PGstGLContext; alloc_params:PGstAllocationParams; v_info:PGstVideoInfo; plane:Tguint; valign:PGstVideoAlignment; 
           target:TGstGLTextureTarget; tex_format:TGstGLFormat):PGstGLVideoAllocationParams;cdecl;external libgstgl;
function gst_gl_video_allocation_params_new_wrapped_data(context:PGstGLContext; alloc_params:PGstAllocationParams; v_info:PGstVideoInfo; plane:Tguint; valign:PGstVideoAlignment; 
           target:TGstGLTextureTarget; tex_format:TGstGLFormat; wrapped_data:Tgpointer; user_data:Tgpointer; notify:TGDestroyNotify):PGstGLVideoAllocationParams;cdecl;external libgstgl;
function gst_gl_video_allocation_params_new_wrapped_texture(context:PGstGLContext; alloc_params:PGstAllocationParams; v_info:PGstVideoInfo; plane:Tguint; valign:PGstVideoAlignment; 
           target:TGstGLTextureTarget; tex_format:TGstGLFormat; tex_id:Tguint; user_data:Tgpointer; notify:TGDestroyNotify):PGstGLVideoAllocationParams;cdecl;external libgstgl;
function gst_gl_video_allocation_params_new_wrapped_gl_handle(context:PGstGLContext; alloc_params:PGstAllocationParams; v_info:PGstVideoInfo; plane:Tguint; valign:PGstVideoAlignment; 
           target:TGstGLTextureTarget; tex_format:TGstGLFormat; gl_handle:Tgpointer; user_data:Tgpointer; notify:TGDestroyNotify):PGstGLVideoAllocationParams;cdecl;external libgstgl;
{ subclass usage  }
procedure gst_gl_video_allocation_params_free_data(params:PGstGLVideoAllocationParams);cdecl;external libgstgl;
{ subclass usage  }
procedure gst_gl_video_allocation_params_copy_data(src_vid:PGstGLVideoAllocationParams; dest_vid:PGstGLVideoAllocationParams);cdecl;external libgstgl;
{*
 * GstGLMemoryAllocator
 *
 * Opaque #GstGLMemoryAllocator struct
  }
{< private > }
type
  PGstGLMemoryAllocator = ^TGstGLMemoryAllocator;
  TGstGLMemoryAllocator = record
      parent : TGstGLBaseMemoryAllocator;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLMemoryAllocatorClass:
 * @map: provide a custom map implementation
 * @copy: provide a custom copy implementation
 * @unmap: provide a custom unmap implementation
  }
{< private > }
{< public > }
{< private > }
  PGstGLMemoryAllocatorClass = ^TGstGLMemoryAllocatorClass;
  TGstGLMemoryAllocatorClass = record
      parent_class : TGstGLBaseMemoryAllocatorClass;
      map : TGstGLBaseMemoryAllocatorMapFunction;
      copy : TGstGLBaseMemoryAllocatorCopyFunction;
      unmap : TGstGLBaseMemoryAllocatorUnmapFunction;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$include <gst/gl/gstglbasememory.h>}
{*
 * GST_GL_MEMORY_ALLOCATOR_NAME:
 *
 * The name of the GL memory allocator
  }

const
  GST_GL_MEMORY_ALLOCATOR_NAME = 'GLMemory';  
{*
 * GST_TYPE_GL_MEMORY:
 *
 * Since: 1.20
 * Deprecated: 1.22: This type has no use.
  }

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY : longint; { return type might be wrong }

{xxxxxxxxGST_GL_DEPRECATED }
function gst_gl_memory_get_type:TGType;cdecl;external libgstgl;
procedure gst_gl_memory_init_once;cdecl;external libgstgl;
function gst_is_gl_memory(mem:PGstMemory):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_memory_init(mem:PGstGLMemory; allocator:PGstAllocator; parent:PGstMemory; context:PGstGLContext; target:TGstGLTextureTarget; 
            tex_format:TGstGLFormat; params:PGstAllocationParams; info:PGstVideoInfo; plane:Tguint; valign:PGstVideoAlignment; 
            user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstgl;
function gst_gl_memory_copy_into(gl_mem:PGstGLMemory; tex_id:Tguint; target:TGstGLTextureTarget; tex_format:TGstGLFormat; width:Tgint; 
           height:Tgint):Tgboolean;cdecl;external libgstgl;
function gst_gl_memory_copy_teximage(src:PGstGLMemory; tex_id:Tguint; out_target:TGstGLTextureTarget; out_tex_format:TGstGLFormat; out_width:Tgint; 
           out_height:Tgint):Tgboolean;cdecl;external libgstgl;
function gst_gl_memory_read_pixels(gl_mem:PGstGLMemory; write_pointer:Tgpointer):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_memory_texsubimage(gl_mem:PGstGLMemory; read_pointer:Tgpointer);cdecl;external libgstgl;
{ accessors  }
function gst_gl_memory_get_texture_width(gl_mem:PGstGLMemory):Tgint;cdecl;external libgstgl;
function gst_gl_memory_get_texture_height(gl_mem:PGstGLMemory):Tgint;cdecl;external libgstgl;
function gst_gl_memory_get_texture_format(gl_mem:PGstGLMemory):TGstGLFormat;cdecl;external libgstgl;
function gst_gl_memory_get_texture_target(gl_mem:PGstGLMemory):TGstGLTextureTarget;cdecl;external libgstgl;
function gst_gl_memory_get_texture_id(gl_mem:PGstGLMemory):Tguint;cdecl;external libgstgl;
function gst_gl_memory_setup_buffer(allocator:PGstGLMemoryAllocator; buffer:PGstBuffer; params:PGstGLVideoAllocationParams; tex_formats:PGstGLFormat; wrapped_data:Pgpointer; 
           n_wrapped_pointers:Tgsize):Tgboolean;cdecl;external libgstgl;
function gst_gl_memory_allocator_get_default(context:PGstGLContext):PGstGLMemoryAllocator;cdecl;external libgstgl;
{$endif}
{ _GST_GL_MEMORY_H_  }

// === Konventiert am: 14-7-26 13:07:37 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MEMORY_ALLOCATOR:=gst_gl_memory_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_GL_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_MEMORY_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_MEMORY_ALLOCATOR,GstGLMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_GL_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_MEMORY_ALLOCATOR,GstGLMemoryAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_GL_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_MEMORY_ALLOCATOR,GstGLMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstGLMemoryAllocator;
begin
  GST_GL_MEMORY_ALLOCATOR_CAST:=PGstGLMemoryAllocator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_CAST(obj : longint) : PGstGLMemory;
begin
  GST_GL_MEMORY_CAST:=PGstGLMemory(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS:=gst_gl_video_allocation_params_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MEMORY:=gst_gl_memory_get_type;
  end;


end.
