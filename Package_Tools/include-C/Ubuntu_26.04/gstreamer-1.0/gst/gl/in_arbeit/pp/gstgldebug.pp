
unit gstgldebug;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstgldebug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgldebug.h
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
Pgchar  = ^gchar;
PGObject  = ^GObject;
PGstDebugCategory  = ^GstDebugCategory;
PGstGLAsyncDebug  = ^GstGLAsyncDebug;
PGstGLAsyncDebugLogGetMessage  = ^GstGLAsyncDebugLogGetMessage;
PGstGLContext  = ^GstGLContext;
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
(* Const before type ignored *)
(* Const before type ignored *)
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


function gst_gl_async_debug_new:PGstGLAsyncDebug;cdecl;external;
procedure gst_gl_async_debug_free(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_init(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_unset(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_freeze(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_thaw(ad:PGstGLAsyncDebug);cdecl;external;
(* Const before type ignored *)
procedure gst_gl_insert_debug_marker(context:PGstGLContext; format:Pgchar; args:array of const);cdecl;external;
procedure gst_gl_insert_debug_marker(context:PGstGLContext; format:Pgchar);cdecl;external;
{ (2, 3); }
procedure gst_gl_async_debug_output_log_msg(ad:PGstGLAsyncDebug);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_async_debug_store_log_msg(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar; args:array of const);cdecl;external;
procedure gst_gl_async_debug_store_log_msg(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar);cdecl;external;
{ (8, 9); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_async_debug_store_log_msg_valist(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar; varargs:Tva_list);cdecl;external;
{ (8, 0); }
{$endif}
{ __GST_GL_DEBUG_H__  }

implementation


end.
