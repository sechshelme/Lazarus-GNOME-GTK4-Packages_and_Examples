unit gstglbufferpool;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef _GST_GL_BUFFER_POOL_H_}
{$define _GST_GL_BUFFER_POOL_H_}
{$include <gst/video/gstvideometa.h>}
{$include <gst/video/gstvideopool.h>}
{$include <gst/gl/gstglbasememory.h>}
{ buffer pool functions  }

function gst_gl_buffer_pool_get_type:TGType;cdecl;external libgstgl;
{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BUFFER_POOL_CAST(obj : longint) : PGstGLBufferPool;

{*
 * GstGLBufferPool:
 *
 * Opaque GstGLBufferPool struct
  }
{< private > }
type
  PGstGLBufferPool = ^TGstGLBufferPool;
  TGstGLBufferPool = record
      bufferpool : TGstBufferPool;
      context : PGstGLContext;
      priv : PGstGLBufferPoolPrivate;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLBufferPoolClass:
 *
 * The #GstGLBufferPoolClass structure contains only private data
  }
{< private > }
  PGstGLBufferPoolClass = ^TGstGLBufferPoolClass;
  TGstGLBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_buffer_pool_new(context:PGstGLContext):PGstBufferPool;cdecl;external libgstgl;
function gst_gl_buffer_pool_get_gl_allocation_params(pool:PGstGLBufferPool):PGstGLAllocationParams;cdecl;external libgstgl;
function gst_buffer_pool_config_get_gl_allocation_params(config:PGstStructure):PGstGLAllocationParams;cdecl;external libgstgl;
procedure gst_buffer_pool_config_set_gl_allocation_params(config:PGstStructure; params:PGstGLAllocationParams);cdecl;external libgstgl;
function gst_buffer_pool_config_get_gl_min_free_queue_size(config:PGstStructure):Tguint;cdecl;external libgstgl;
procedure gst_buffer_pool_config_set_gl_min_free_queue_size(config:PGstStructure; queue_size:Tguint);cdecl;external libgstgl;
{$endif}
{ _GST_GL_BUFFER_POOL_H_  }

// === Konventiert am: 14-7-26 12:54:32 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_GL_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BUFFER_POOL:=gst_gl_buffer_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BUFFER_POOL(obj : longint) : longint;
begin
  GST_IS_GL_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BUFFER_POOL(obj : longint) : longint;
begin
  GST_GL_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_BUFFER_POOL,GstGLBufferPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BUFFER_POOL_CAST(obj : longint) : PGstGLBufferPool;
begin
  GST_GL_BUFFER_POOL_CAST:=PGstGLBufferPool(obj);
end;


end.
