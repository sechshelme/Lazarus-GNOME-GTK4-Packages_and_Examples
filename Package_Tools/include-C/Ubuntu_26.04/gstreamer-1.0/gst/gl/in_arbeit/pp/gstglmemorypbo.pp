
unit gstglmemorypbo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglmemorypbo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglmemorypbo.h
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
PGstGLBuffer  = ^GstGLBuffer;
PGstGLMemoryPBO  = ^GstGLMemoryPBO;
PGstGLMemoryPBOAllocator  = ^GstGLMemoryPBOAllocator;
PGstGLMemoryPBOAllocatorClass  = ^GstGLMemoryPBOAllocatorClass;
PGstMemory  = ^GstMemory;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef _GST_GL_MEMORY_PBO_H_}
{$define _GST_GL_MEMORY_PBO_H_}
{$include <gst/gl/gstglmemory.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_PBO_ALLOCATOR : longint; { return type might be wrong }

function gst_gl_memory_pbo_allocator_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_PBO_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_PBO_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_PBO_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_PBO_ALLOCATOR_CAST(obj : longint) : PGstGLMemoryPBOAllocator;

{*
 * GstGLMemoryPBO:
 *
 * Private instance
  }
{< private > }
type
  PGstGLMemoryPBO = ^TGstGLMemoryPBO;
  TGstGLMemoryPBO = record
      mem : TGstGLMemory;
      pbo : PGstGLBuffer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_GL_MEMORY_PBO_ALLOCATOR_NAME:
 *
 * The name of the GL Memory PBO allocator
  }

const
  GST_GL_MEMORY_PBO_ALLOCATOR_NAME = 'GLMemoryPBO';  
{*
 * GST_TYPE_GL_MEMORY_PBO
 *
 * Since: 1.20
 * Deprecated: 1.22: This type has no use.
  }

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_PBO : longint; { return type might be wrong }

{ xxxxxxxxGST_GL_DEPRECATED }
function gst_gl_memory_pbo_get_type:TGType;cdecl;external;
procedure gst_gl_memory_pbo_init_once;cdecl;external;
function gst_is_gl_memory_pbo(mem:PGstMemory):Tgboolean;cdecl;external;
procedure gst_gl_memory_pbo_download_transfer(gl_mem:PGstGLMemoryPBO);cdecl;external;
procedure gst_gl_memory_pbo_upload_transfer(gl_mem:PGstGLMemoryPBO);cdecl;external;
function gst_gl_memory_pbo_copy_into_texture(gl_mem:PGstGLMemoryPBO; tex_id:Tguint; target:TGstGLTextureTarget; tex_format:TGstGLFormat; width:Tgint; 
           height:Tgint; stride:Tgint; respecify:Tgboolean):Tgboolean;cdecl;external;
{*
 * GstGLMemoryPBOAllocator:
 *
 * Opaque #GstGLMemoryPBOAllocator struct
  }
{< private > }
type
  PGstGLMemoryPBOAllocator = ^TGstGLMemoryPBOAllocator;
  TGstGLMemoryPBOAllocator = record
      parent : TGstGLMemoryAllocator;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLMemoryPBOAllocatorClass:
 *
 * Only contains private data
  }
{< private > }
  PGstGLMemoryPBOAllocatorClass = ^TGstGLMemoryPBOAllocatorClass;
  TGstGLMemoryPBOAllocatorClass = record
      parent_class : TGstGLMemoryAllocatorClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$endif}
{ _GST_GL_MEMORY_PBO_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_PBO_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MEMORY_PBO_ALLOCATOR:=gst_gl_memory_pbo_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_PBO_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_GL_MEMORY_PBO_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_MEMORY_PBO_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_MEMORY_PBO_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_MEMORY_PBO_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_PBO_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_MEMORY_PBO_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_MEMORY_PBO_ALLOCATOR,GstGLMemoryPBOAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_PBO_ALLOCATOR(obj : longint) : longint;
begin
  GST_GL_MEMORY_PBO_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_MEMORY_PBO_ALLOCATOR,GstGLMemoryPBOAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_GL_MEMORY_PBO_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_MEMORY_PBO_ALLOCATOR,GstGLMemoryPBOAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_PBO_ALLOCATOR_CAST(obj : longint) : PGstGLMemoryPBOAllocator;
begin
  GST_GL_MEMORY_PBO_ALLOCATOR_CAST:=PGstGLMemoryPBOAllocator(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_PBO : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MEMORY_PBO:=gst_gl_memory_pbo_get_type;
  end;


end.
