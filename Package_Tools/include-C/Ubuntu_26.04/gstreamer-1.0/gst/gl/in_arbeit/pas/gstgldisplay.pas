unit gstgldisplay;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2007 David A. Schleef <ds@schleef.org>
 * Copyright (C) 2008 Julien Isorce <julien.isorce@gmail.com>
 * Copyright (C) 2008 Filippo Argiolas <filippo.argiolas@gmail.com>
 * Copyright (C) 2013 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef __GST_GL_DISPLAY_H__}
{$define __GST_GL_DISPLAY_H__}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_display_get_type:TGType;cdecl;external libgstgl;
{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_CAST(obj : longint) : PGstGLDisplay;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_GET_CLASS(obj : longint) : longint;

{*
 * GstGLDisplayType:
 * @GST_GL_DISPLAY_TYPE_NONE: no display type
 * @GST_GL_DISPLAY_TYPE_X11: X11 display
 * @GST_GL_DISPLAY_TYPE_WAYLAND: Wayland display
 * @GST_GL_DISPLAY_TYPE_COCOA: Cocoa display
 * @GST_GL_DISPLAY_TYPE_WIN32: Win32 display
 * @GST_GL_DISPLAY_TYPE_DISPMANX: Dispmanx display
 * @GST_GL_DISPLAY_TYPE_EGL: EGL display
 * @GST_GL_DISPLAY_TYPE_VIV_FB: Vivante Framebuffer display
 * @GST_GL_DISPLAY_TYPE_GBM: Mesa3D GBM display
 * @GST_GL_DISPLAY_TYPE_ANY: any display type
  }
{*
 * GST_GL_DISPLAY_TYPE_EGL_DEVICE:
 *
 * EGLDevice display.
 *
 * Since: 1.18
  }
{*
 * GST_GL_DISPLAY_TYPE_EAGL:
 *
 * EAGL display.
 *
 * Since: 1.20
  }
{*
 * GST_GL_DISPLAY_TYPE_WINRT:
 *
 * WinRT display.
 *
 * Since: 1.20
  }
{*
 * GST_GL_DISPLAY_TYPE_ANDROID:
 *
 * Android display.
 *
 * Since: 1.20
  }
{*
 * GST_GL_DISPLAY_TYPE_EGL_SURFACELESS:
 *
 * Mesa3D surfaceless display using the EGL_PLATFORM_SURFACELESS_MESA
 * extension.
 *
 * Since: 1.24
  }
type
  PGstGLDisplayType = ^TGstGLDisplayType;
  TGstGLDisplayType =  Longint;
  Const
    GST_GL_DISPLAY_TYPE_NONE = 0;
    GST_GL_DISPLAY_TYPE_X11 = 1 shl 0;
    GST_GL_DISPLAY_TYPE_WAYLAND = 1 shl 1;
    GST_GL_DISPLAY_TYPE_COCOA = 1 shl 2;
    GST_GL_DISPLAY_TYPE_WIN32 = 1 shl 3;
    GST_GL_DISPLAY_TYPE_DISPMANX = 1 shl 4;
    GST_GL_DISPLAY_TYPE_EGL = 1 shl 5;
    GST_GL_DISPLAY_TYPE_VIV_FB = 1 shl 6;
    GST_GL_DISPLAY_TYPE_GBM = 1 shl 7;
    GST_GL_DISPLAY_TYPE_EGL_DEVICE = 1 shl 8;
    GST_GL_DISPLAY_TYPE_EAGL = 1 shl 9;
    GST_GL_DISPLAY_TYPE_WINRT = 1 shl 10;
    GST_GL_DISPLAY_TYPE_ANDROID = 1 shl 11;
    GST_GL_DISPLAY_TYPE_EGL_SURFACELESS = 1 shl 12;
    GST_GL_DISPLAY_TYPE_ANY = G_MAXUINT32;
;
{*
 * GstGLDisplay:
 *
 * The contents of a #GstGLDisplay are private and should only be accessed
 * through the provided API
  }
{< private > }
{< protected > }
{ internal lock, use *_window functions instead  }
type
  PGstGLDisplay = ^TGstGLDisplay;
  TGstGLDisplay = record
      object : TGstObject;
      _type : TGstGLDisplayType;
      windows : PGList;
      main_context : PGMainContext;
      main_loop : PGMainLoop;
      event_source : PGSource;
      priv : PGstGLDisplayPrivate;
    end;

{< private > }
  PGstGLDisplayClass = ^TGstGLDisplayClass;
  TGstGLDisplayClass = record
      object_class : TGstObjectClass;
      get_handle : function (display:PGstGLDisplay):Tguintptr;cdecl;
      create_window : function (display:PGstGLDisplay):PGstGLWindow;cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_display_new:PGstGLDisplay;cdecl;external libgstgl;
function gst_gl_display_new_with_type(_type:TGstGLDisplayType):PGstGLDisplay;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_gl_display_lock(display : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_gl_display_unlock(display : longint) : longint;

function gst_gl_display_get_handle(display:PGstGLDisplay):Tguintptr;cdecl;external libgstgl;
function gst_gl_display_get_handle_type(display:PGstGLDisplay):TGstGLDisplayType;cdecl;external libgstgl;
procedure gst_gl_display_filter_gl_api(display:PGstGLDisplay; gl_api:TGstGLAPI);cdecl;external libgstgl;
function gst_gl_display_get_gl_api(display:PGstGLDisplay):TGstGLAPI;cdecl;external libgstgl;
function gst_gl_display_get_gl_api_unlocked(display:PGstGLDisplay):TGstGLAPI;cdecl;external libgstgl;
{*
 * GST_GL_DISPLAY_CONTEXT_TYPE:
 *
 * The name used in #GstContext queries for requesting a #GstGLDisplay
  }
const
  GST_GL_DISPLAY_CONTEXT_TYPE = 'gst.gl.GLDisplay';  

procedure gst_context_set_gl_display(context:PGstContext; display:PGstGLDisplay);cdecl;external libgstgl;
function gst_context_get_gl_display(context:PGstContext; display:PPGstGLDisplay):Tgboolean;cdecl;external libgstgl;
function gst_gl_display_create_context(display:PGstGLDisplay; other_context:PGstGLContext; p_context:PPGstGLContext; error:PPGError):Tgboolean;cdecl;external libgstgl;
function gst_gl_display_get_gl_context_for_thread(display:PGstGLDisplay; thread:PGThread):PGstGLContext;cdecl;external libgstgl;
function gst_gl_display_add_context(display:PGstGLDisplay; context:PGstGLContext):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_display_remove_context(display:PGstGLDisplay; context:PGstGLContext);cdecl;external libgstgl;
function gst_gl_display_ensure_context(display:PGstGLDisplay; other_context:PGstGLContext; context:PPGstGLContext; error:PPGError):Tgboolean;cdecl;external libgstgl;
function gst_gl_display_create_window(display:PGstGLDisplay):PGstGLWindow;cdecl;external libgstgl;
function gst_gl_display_remove_window(display:PGstGLDisplay; window:PGstGLWindow):Tgboolean;cdecl;external libgstgl;
{xxxxxxxGST_GL_DEPRECATED_FOR(gst_gl_display_retrieve_window) }
function gst_gl_display_find_window(display:PGstGLDisplay; data:Tgpointer; compare_func:TGCompareFunc):PGstGLWindow;cdecl;external libgstgl;
function gst_gl_display_retrieve_window(display:PGstGLDisplay; data:Tgpointer; compare_func:TGCompareFunc):PGstGLWindow;cdecl;external libgstgl;
{$endif}
{ __GST_GL_DISPLAY_H__  }

// === Konventiert am: 14-7-26 13:02:31 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_DISPLAY:=gst_gl_display_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY(obj : longint) : longint;
begin
  GST_GL_DISPLAY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_DISPLAY,GstGLDisplay);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_CLASS(klass : longint) : longint;
begin
  GST_GL_DISPLAY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_DISPLAY,GstGLDisplayClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY(obj : longint) : longint;
begin
  GST_IS_GL_DISPLAY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_DISPLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_DISPLAY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_DISPLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_CAST(obj : longint) : PGstGLDisplay;
begin
  GST_GL_DISPLAY_CAST:=PGstGLDisplay(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_DISPLAY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_GL_DISPLAY,GstGLDisplayClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_gl_display_lock(display : longint) : longint;
begin
  gst_gl_display_lock:=GST_OBJECT_LOCK(display);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_gl_display_unlock(display : longint) : longint;
begin
  gst_gl_display_unlock:=GST_OBJECT_UNLOCK(display);
end;


end.
