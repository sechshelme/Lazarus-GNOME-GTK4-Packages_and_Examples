unit gstglsyncmeta;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_GL_SYNC_META_H__}
{$define __GST_GL_SYNC_META_H__}
{$include <gst/gl/gstgl_fwd.h>}

{ was #define dname def_expr }
function GST_GL_SYNC_META_API_TYPE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_GL_SYNC_META_INFO : longint; { return type might be wrong }

type
{*
 * GST_BUFFER_POOL_OPTION_GL_SYNC_META:
 *
 * An option that can be activated on bufferpools to request OpenGL
 * synchronization metadata on buffers from the pool.
  }

const
  GST_BUFFER_POOL_OPTION_GL_SYNC_META = 'GstBufferPoolOptionGLSyncMeta';  
{*
 * GstGLSyncMeta:
 * @parent: the parent #GstMeta
 * @context: the #GstGLContext used to allocate the meta
 * @data: a custom data pointer for the implementation
 * @set_sync: set a sync point in the OpenGL command stream
 * @set_sync_gl: the same as @set_sync but called from @context's thread
 * @wait: execute a wait on the previously set sync point into the OpenGL command stream
 * @wait_gl: the same as @wait but called from @context's thread
 * @wait_cpu: wait for the previously set sync point to pass from the CPU
 * @wait_cpu_gl: the same as @wait_cpu but called from @context's thread
 * @copy: copy @data into a new #GstGLSyncMeta
 * @free: free @data
 * @free_gl: free @data in @context's thread
  }
type
  PGstGLSyncMeta = ^TGstGLSyncMeta;
  TGstGLSyncMeta = record
      parent : TGstMeta;
      context : PGstGLContext;
      data : Tgpointer;
      set_sync : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      set_sync_gl : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      wait : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      wait_gl : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      wait_cpu : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      wait_cpu_gl : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      copy : procedure (src:PGstGLSyncMeta; sbuffer:PGstBuffer; dest:PGstGLSyncMeta; dbuffer:PGstBuffer);cdecl;
      free : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
      free_gl : procedure (sync:PGstGLSyncMeta; context:PGstGLContext);cdecl;
    end;


function gst_gl_sync_meta_api_get_type:TGType;cdecl;external libgstgl;
function gst_gl_sync_meta_get_info:PGstMetaInfo;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_gl_sync_meta(b : longint) : PGstGLSyncMeta;

function gst_buffer_add_gl_sync_meta(context:PGstGLContext; buffer:PGstBuffer):PGstGLSyncMeta;cdecl;external libgstgl;
function gst_buffer_add_gl_sync_meta_full(context:PGstGLContext; buffer:PGstBuffer; data:Tgpointer):PGstGLSyncMeta;cdecl;external libgstgl;
procedure gst_gl_sync_meta_set_sync_point(sync_meta:PGstGLSyncMeta; context:PGstGLContext);cdecl;external libgstgl;
procedure gst_gl_sync_meta_wait(sync_meta:PGstGLSyncMeta; context:PGstGLContext);cdecl;external libgstgl;
procedure gst_gl_sync_meta_wait_cpu(sync_meta:PGstGLSyncMeta; context:PGstGLContext);cdecl;external libgstgl;
{$endif}
{ __GST_GL_SYNC_META_H__  }

// === Konventiert am: 14-7-26 13:09:51 ===


implementation


{ was #define dname def_expr }
function GST_GL_SYNC_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_GL_SYNC_META_API_TYPE:=gst_gl_sync_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_GL_SYNC_META_INFO : longint; { return type might be wrong }
  begin
    GST_GL_SYNC_META_INFO:=gst_gl_sync_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_gl_sync_meta(b : longint) : PGstGLSyncMeta;
begin
  gst_buffer_get_gl_sync_meta:=PGstGLSyncMeta(gst_buffer_get_meta(b,GST_GL_SYNC_META_API_TYPE));
end;


end.
