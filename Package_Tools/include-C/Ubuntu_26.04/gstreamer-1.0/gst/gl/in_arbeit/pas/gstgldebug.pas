unit gstgldebug;

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
{$ifndef __GST_GL_DEBUG_H__}
{$define __GST_GL_DEBUG_H__}
{$include <gst/gl/gstgl_fwd.h>}
type
  PGstGLAsyncDebugLogGetMessage = ^TGstGLAsyncDebugLogGetMessage;
  TGstGLAsyncDebugLogGetMessage = function (user_data:Tgpointer):Pgchar;cdecl;
{*
 * GstGLAsyncDebug:
 *
 * #GstGLAsyncDebug an opaque structure and should only be accessed through the
 * provided API.
  }
{< private > }
{< protected > }
  PGstGLAsyncDebug = ^TGstGLAsyncDebug;
  TGstGLAsyncDebug = record
      state_flags : Tguint;cdecl;
      cat : PGstDebugCategory;
      level : TGstDebugLevel;
      file : Pgchar;
      _function : Pgchar;
      line : Tgint;
      object : PGObject;
      debug_msg : Pgchar;
      callback : TGstGLAsyncDebugLogGetMessage;
      user_data : Tgpointer;
      notify : TGDestroyNotify;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_async_debug_new:PGstGLAsyncDebug;cdecl;external libgstgl;
procedure gst_gl_async_debug_free(ad:PGstGLAsyncDebug);cdecl;external libgstgl;
procedure gst_gl_async_debug_init(ad:PGstGLAsyncDebug);cdecl;external libgstgl;
procedure gst_gl_async_debug_unset(ad:PGstGLAsyncDebug);cdecl;external libgstgl;
procedure gst_gl_async_debug_freeze(ad:PGstGLAsyncDebug);cdecl;external libgstgl;
procedure gst_gl_async_debug_thaw(ad:PGstGLAsyncDebug);cdecl;external libgstgl;
procedure gst_gl_insert_debug_marker(context:PGstGLContext; format:Pgchar; args:array of const);cdecl;external libgstgl;
procedure gst_gl_insert_debug_marker(context:PGstGLContext; format:Pgchar);cdecl;external libgstgl;
{ (2, 3); }
procedure gst_gl_async_debug_output_log_msg(ad:PGstGLAsyncDebug);cdecl;external libgstgl;
procedure gst_gl_async_debug_store_log_msg(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar; args:array of const);cdecl;external libgstgl;
procedure gst_gl_async_debug_store_log_msg(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar);cdecl;external libgstgl;
{ (8, 9); }
procedure gst_gl_async_debug_store_log_msg_valist(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar; varargs:Tva_list);cdecl;external libgstgl;
{ (8, 0); }
{$endif}
{ __GST_GL_DEBUG_H__  }

// === Konventiert am: 14-7-26 13:02:35 ===


implementation



end.
