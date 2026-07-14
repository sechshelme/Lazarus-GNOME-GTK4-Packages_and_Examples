
unit gstglbuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglbuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglbuffer
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
PGstAllocationParams  = ^GstAllocationParams;
PGstGLBuffer  = ^GstGLBuffer;
PGstGLBufferAllocationParams  = ^GstGLBufferAllocationParams;
PGstGLBufferAllocator  = ^GstGLBufferAllocator;
PGstGLBufferAllocatorClass  = ^GstGLBufferAllocatorClass;
PGstGLContext  = ^GstGLContext;
PGstMemory  = ^GstMemory;
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
{$ifndef _GST_GL_BUFFER_H_}
{$define _GST_GL_BUFFER_H_}
{$include <gst/gl/gstglbasememory.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER_ALLOCATOR : longint; { return type might be wrong }

function gst_gl_buffer_allocator_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BUFFER_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BUFFER_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BUFFER_ALLOCATOR_CAST(obj : longint) : PGstGLBufferAllocator;

{*
 * GstGLBuffer:
 * @mem: the parent object
 * @id: the buffer id for this memory
 * @target: the OpenGL target of this texture for binding purposes
 * @usage_hints: the OpenGL usage hints this buffer was created with
 *
 * Represents information about a GL buffer
  }
{ XXX: put this in the allocator?  }
{ XXX: put this in the allocator?  }
type
  PGstGLBuffer = ^TGstGLBuffer;
  TGstGLBuffer = record
      mem : TGstGLBaseMemory;
      id : Tguint;
      target : Tguint;
      usage_hints : Tguint;
    end;


{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS : longint; { return type might be wrong }

function gst_gl_buffer_allocation_params_get_type:TGType;cdecl;external;
{*
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_BUFFER:
 *
 * GL allocation flag indicating the allocation of a GL buffer.
  }
const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_BUFFER = 1 shl 4;  
{*
 * GstGLBufferAllocationParams:
 * @parent: parent object
 * @gl_target: the OpenGL target to bind the buffer to
 * @gl_usage: the OpenGL usage hint to create the buffer with
  }
{< private > }
type
  PGstGLBufferAllocationParams = ^TGstGLBufferAllocationParams;
  TGstGLBufferAllocationParams = record
      parent : TGstGLAllocationParams;
      gl_target : Tguint;
      gl_usage : Tguint;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

function gst_gl_buffer_allocation_params_new(context:PGstGLContext; alloc_size:Tgsize; alloc_params:PGstAllocationParams; gl_target:Tguint; gl_usage:Tguint):PGstGLBufferAllocationParams;cdecl;external;
{*
 * GstGLBufferAllocator:
 *
 * Opaque #GstGLBufferAllocator struct
  }
{< private > }
type
  PGstGLBufferAllocator = ^TGstGLBufferAllocator;
  TGstGLBufferAllocator = record
      parent : TGstGLBaseMemoryAllocator;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLBufferAllocatorClass:
 *
 * The #GstGLBufferAllocatorClass only contains private data
  }
{< private > }
  PGstGLBufferAllocatorClass = ^TGstGLBufferAllocatorClass;
  TGstGLBufferAllocatorClass = record
      parent_class : TGstGLBaseMemoryAllocatorClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_CAPS_FEATURE_MEMORY_GL_BUFFER:
 *
 * Name of the caps feature indicating the use of GL buffers
  }

const
  GST_CAPS_FEATURE_MEMORY_GL_BUFFER = 'memory:GLBuffer';  
{*
 * GST_GL_BUFFER_ALLOCATOR_NAME:
 *
 * The name of the GL buffer allocator
  }
  GST_GL_BUFFER_ALLOCATOR_NAME = 'GLBuffer';  
{*
 * GST_TYPE_GL_BUFFER:
 *
 * Since: 1.20
 * Deprecated: 1.22: This type has no use.
  }

{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER : longint; { return type might be wrong }

{xxxxx GST_GL_DEPRECATED }
function gst_gl_buffer_get_type:TGType;cdecl;external;
procedure gst_gl_buffer_init_once;cdecl;external;
function gst_is_gl_buffer(mem:PGstMemory):Tgboolean;cdecl;external;
{$endif}
{ _GST_GL_BUFFER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BUFFER_ALLOCATOR:=gst_gl_buffer_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BUFFER_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_GL_BUFFER_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BUFFER_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_BUFFER_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_BUFFER_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_BUFFER_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_BUFFER_ALLOCATOR,GstGLBufferAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_ALLOCATOR(obj : longint) : longint;
begin
  GST_GL_BUFFER_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_BUFFER_ALLOCATOR,GstGLBufferAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_GL_BUFFER_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_BUFFER_ALLOCATOR,GstGLBufferAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BUFFER_ALLOCATOR_CAST(obj : longint) : PGstGLBufferAllocator;
begin
  GST_GL_BUFFER_ALLOCATOR_CAST:=PGstGLBufferAllocator(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS:=gst_gl_buffer_allocation_params_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BUFFER:=gst_gl_buffer_get_type;
  end;


end.
