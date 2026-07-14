
unit gstglrenderbuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglrenderbuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglrenderbuffer.h
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
PGstGLContext  = ^GstGLContext;
PGstGLRenderbuffer  = ^GstGLRenderbuffer;
PGstGLRenderbufferAllocationParams  = ^GstGLRenderbufferAllocationParams;
PGstGLRenderbufferAllocator  = ^GstGLRenderbufferAllocator;
PGstGLRenderbufferAllocatorClass  = ^GstGLRenderbufferAllocatorClass;
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
{$ifndef _GST_GL_RENDERBUFFER_H_}
{$define _GST_GL_RENDERBUFFER_H_}
{$include <gst/gl/gstglbasememory.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_RENDERBUFFER_ALLOCATOR : longint; { return type might be wrong }

function gst_gl_renderbuffer_allocator_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_RENDERBUFFER_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_RENDERBUFFER_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_RENDERBUFFER_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_RENDERBUFFER_ALLOCATOR_CAST(obj : longint) : PGstGLRenderbufferAllocator;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_RENDERBUFFER_CAST(obj : longint) : PGstGLRenderbuffer;

{*
 * GST_GL_RENDERBUFFER_ALLOCATOR_NAME:
 *
 * The name of the GL renderbuffer allocator
  }
const
  GST_GL_RENDERBUFFER_ALLOCATOR_NAME = 'GLRenderbuffer';  
{*
 * GstGLRenderbuffer:
 * @renderbuffer_id: the GL texture id for this memory
 * @renderbuffer_format: the texture type
 * @width: the width
 * @height: the height
 *
 * Represents information about a GL renderbuffer
  }
{< private > }
{< public > }
{< protected > }
{< private > }
type
  PGstGLRenderbuffer = ^TGstGLRenderbuffer;
  TGstGLRenderbuffer = record
      mem : TGstGLBaseMemory;
      renderbuffer_id : Tguint;
      renderbuffer_format : TGstGLFormat;
      width : Tguint;
      height : Tguint;
      renderbuffer_wrapped : Tgboolean;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLRenderbufferAllocator:
 *
 * Opaque #GstGLRenderbufferAllocator struct
  }
{< private > }
  PGstGLRenderbufferAllocator = ^TGstGLRenderbufferAllocator;
  TGstGLRenderbufferAllocator = record
      parent : TGstGLBaseMemoryAllocator;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLRenderbufferAllocatorClass:
 *
 * The #GstGLRenderbufferAllocatorClass only contains private data
  }
{< private > }
  PGstGLRenderbufferAllocatorClass = ^TGstGLRenderbufferAllocatorClass;
  TGstGLRenderbufferAllocatorClass = record
      parent_class : TGstGLBaseMemoryAllocatorClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$include <gst/gl/gstglbasememory.h>}
type

function gst_gl_renderbuffer_allocation_params_get_type:TGType;cdecl;external;
const
  GST_TYPE_RENDERBUFFER_ALLOCATION_PARAMS = gst_gl_renderbuffer_allocation_params_get_type;  
{*
 * GstGLRenderbufferAllocationParams:
 * @renderbuffer_format: the #GstGLFormat
 * @width: the width
 * @height: the height
 *
 * Allocation parameters
  }
{< private > }
{< public > }
{< private > }
type
  PGstGLRenderbufferAllocationParams = ^TGstGLRenderbufferAllocationParams;
  TGstGLRenderbufferAllocationParams = record
      parent : TGstGLAllocationParams;
      renderbuffer_format : TGstGLFormat;
      width : Tguint;
      height : Tguint;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

function gst_gl_renderbuffer_allocation_params_new(context:PGstGLContext; alloc_params:PGstAllocationParams; renderbuffer_format:TGstGLFormat; width:Tguint; height:Tguint):PGstGLRenderbufferAllocationParams;cdecl;external;
(* Const before type ignored *)
function gst_gl_renderbuffer_allocation_params_new_wrapped(context:PGstGLContext; alloc_params:PGstAllocationParams; renderbuffer_format:TGstGLFormat; width:Tguint; height:Tguint; 
           gl_handle:Tgpointer; user_data:Tgpointer; notify:TGDestroyNotify):PGstGLRenderbufferAllocationParams;cdecl;external;
{*
 * GST_TYPE_GL_RENDERBUFFER:
 *
 * Since: 1.20
 * Deprecated: 1.22: This type has no use.
  }
{ was #define dname def_expr }
function GST_TYPE_GL_RENDERBUFFER : longint; { return type might be wrong }

{xxxxxxGST_GL_DEPRECATED }
function gst_gl_renderbuffer_get_type:TGType;cdecl;external;
procedure gst_gl_renderbuffer_init_once;cdecl;external;
function gst_is_gl_renderbuffer(mem:PGstMemory):Tgboolean;cdecl;external;
{ accessors  }
function gst_gl_renderbuffer_get_width(gl_mem:PGstGLRenderbuffer):Tgint;cdecl;external;
function gst_gl_renderbuffer_get_height(gl_mem:PGstGLRenderbuffer):Tgint;cdecl;external;
function gst_gl_renderbuffer_get_format(gl_mem:PGstGLRenderbuffer):TGstGLFormat;cdecl;external;
function gst_gl_renderbuffer_get_id(gl_mem:PGstGLRenderbuffer):Tguint;cdecl;external;
{$endif}
{ _GST_GL_RENDERBUFFER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_RENDERBUFFER_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_RENDERBUFFER_ALLOCATOR:=gst_gl_renderbuffer_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_RENDERBUFFER_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_GL_RENDERBUFFER_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_RENDERBUFFER_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_RENDERBUFFER_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_RENDERBUFFER_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_RENDERBUFFER_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_RENDERBUFFER_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_RENDERBUFFER_ALLOCATOR,GstGLRenderbufferAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_RENDERBUFFER_ALLOCATOR(obj : longint) : longint;
begin
  GST_GL_RENDERBUFFER_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_RENDERBUFFER_ALLOCATOR,GstGLRenderbufferAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_GL_RENDERBUFFER_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_RENDERBUFFER_ALLOCATOR,GstGLRenderbufferAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_RENDERBUFFER_ALLOCATOR_CAST(obj : longint) : PGstGLRenderbufferAllocator;
begin
  GST_GL_RENDERBUFFER_ALLOCATOR_CAST:=PGstGLRenderbufferAllocator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_RENDERBUFFER_CAST(obj : longint) : PGstGLRenderbuffer;
begin
  GST_GL_RENDERBUFFER_CAST:=PGstGLRenderbuffer(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_RENDERBUFFER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_RENDERBUFFER:=gst_gl_renderbuffer_get_type;
  end;


end.
