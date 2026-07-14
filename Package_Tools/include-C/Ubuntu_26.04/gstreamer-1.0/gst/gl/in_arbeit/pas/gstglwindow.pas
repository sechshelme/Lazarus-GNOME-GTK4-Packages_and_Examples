unit gstglwindow;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2008 Julien Isorce <julien.isorce@gmail.com>
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
{$ifndef __GST_GL_WINDOW_H__}
{$define __GST_GL_WINDOW_H__}
{$include <gst/gst.h>}
{$include <gst/gl/gstgl_fwd.h>}
{$include <gst/gl/gstglcontext.h>}
{$include <gst/gl/gstgldisplay.h>}

function gst_gl_window_get_type:TGType;cdecl;external libgstgl;
{ was #define dname def_expr }
function GST_TYPE_GL_WINDOW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_WINDOW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_WINDOW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_LOCK(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_UNLOCK(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_GET_LOCK(w : longint) : longint;

function gst_gl_window_error_quark:TGQuark;cdecl;external libgstgl;
{*
 * GST_GL_WINDOW_ERROR:
 *
 * Error domain for GStreamer's GL window module. Errors in this domain will be
 * from the #GstGLWindowError enumeration
  }
{ was #define dname def_expr }
function GST_GL_WINDOW_ERROR : longint; { return type might be wrong }

{*
 * GstGLWindowError:
 * @GST_GL_WINDOW_ERROR_FAILED: failed for a unspecified reason
 * @GST_GL_WINDOW_ERROR_OLD_LIBS: the implementation is too old
 * @GST_GL_WINDOW_ERROR_RESOURCE_UNAVAILABLE: no such resource was found
  }
type
  PGstGLWindowError = ^TGstGLWindowError;
  TGstGLWindowError =  Longint;
  Const
    GST_GL_WINDOW_ERROR_FAILED = 0;
    GST_GL_WINDOW_ERROR_OLD_LIBS = 1;
    GST_GL_WINDOW_ERROR_RESOURCE_UNAVAILABLE = 2;
;
type

  TGstGLWindowCB = procedure (data:Tgpointer);cdecl;

  TGstGLWindowResizeCB = procedure (data:Tgpointer; width:Tguint; height:Tguint);cdecl;
{*
 * GST_GL_WINDOW_CB:
 * @f: the function to cast
 *
 * Cast to the current function type for generic window callbacks
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_GL_WINDOW_CB(f : longint) : TGstGLWindowCB;

{*
 * GST_GL_WINDOW_RESIZE_CB:
 * @f: the function to cast
 *
 * Cast to the current function type for window resize callbacks
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_WINDOW_RESIZE_CB(f : longint) : TGstGLWindowResizeCB;

{*
 * GstGLWindow:
 *
 * #GstGLWindow is an opaque struct and should only be accessed through the
 * provided api.
  }
{< private > }
{< protected > }
{ default main_context  }
{< private > }
type
  PGstGLWindow = ^TGstGLWindow;
  TGstGLWindow = record
      parent : TGstObject;cdecl;
      lock : TGMutex;
      display : PGstGLDisplay;
      context_ref : TGWeakRef;
      is_drawing : Tgboolean;
      draw : TGstGLWindowCB;
      draw_data : Tgpointer;
      draw_notify : TGDestroyNotify;
      close : TGstGLWindowCB;
      close_data : Tgpointer;
      close_notify : TGDestroyNotify;
      resize : TGstGLWindowResizeCB;
      resize_data : Tgpointer;
      resize_notify : TGDestroyNotify;
      queue_resize : Tgboolean;
      main_context : PGMainContext;
      priv : PGstGLWindowPrivate;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLWindowClass:
 * @parent_class: Parent class
 * @get_display: Gets the current windowing system display connection
 * @set_window_handle: Set a window handle to render into
 * @get_window_handle: Gets the current window handle that this #GstGLWindow is
 *                     rendering into.  This may return a different value to
 *                     what is passed into @set_window_handle
 * @draw: redraw the window with the specified dimensions
 * @run: run the mainloop
 * @quit: send a quit to the mainloop
 * @send_message: invoke a function on the window thread.  Required to be reentrant.
 * @send_message_async: invoke a function on the window thread. @run may or may
 *                      not have been called.  Required to be reentrant.
 * @open: open the connection to the display
 * @close: close the connection to the display
 * @handle_events: whether to handle 'extra' events from the windowing system.
 *                 Basic events like surface moves and resizes are still valid
 *                 things to listen for.
 * @set_preferred_size: request that the window change surface size.  The
 *                      implementation is free to ignore this information.
 * @show: request that the window be shown to the user
 * @set_render_rectangle: request a rectangle to render into.  See #GstVideoOverlay
 * @queue_resize: request a resize to occur when possible
 * @controls_viewport: Whether the window takes care of glViewport setup.
 *                     and the user does not need to deal with viewports
 * @has_output_surface: Whether the window has output surface or not. (Since: 1.18)
  }
{< private > }
  PGstGLWindowClass = ^TGstGLWindowClass;
  TGstGLWindowClass = record
      parent_class : TGstObjectClass;
      get_display : function (window:PGstGLWindow):Tguintptr;cdecl;
      set_window_handle : procedure (window:PGstGLWindow; handle:Tguintptr);cdecl;
      get_window_handle : function (window:PGstGLWindow):Tguintptr;cdecl;
      draw : procedure (window:PGstGLWindow);cdecl;
      run : procedure (window:PGstGLWindow);cdecl;
      quit : procedure (window:PGstGLWindow);cdecl;
      send_message : procedure (window:PGstGLWindow; callback:TGstGLWindowCB; data:Tgpointer);cdecl;
      send_message_async : procedure (window:PGstGLWindow; callback:TGstGLWindowCB; data:Tgpointer; destroy:TGDestroyNotify);cdecl;
      open : function (window:PGstGLWindow; error:PPGError):Tgboolean;cdecl;
      close : procedure (window:PGstGLWindow);cdecl;
      handle_events : procedure (window:PGstGLWindow; handle_events:Tgboolean);cdecl;
      set_preferred_size : procedure (window:PGstGLWindow; width:Tgint; height:Tgint);cdecl;
      show : procedure (window:PGstGLWindow);cdecl;
      set_render_rectangle : function (window:PGstGLWindow; x:Tgint; y:Tgint; width:Tgint; height:Tgint):Tgboolean;cdecl;
      queue_resize : procedure (window:PGstGLWindow);cdecl;
      controls_viewport : function (window:PGstGLWindow):Tgboolean;cdecl;
      has_output_surface : function (window:PGstGLWindow):Tgboolean;cdecl;
      _reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;


function gst_gl_window_new(display:PGstGLDisplay):PGstGLWindow;cdecl;external libgstgl;
{ callbacks  }
procedure gst_gl_window_set_draw_callback(window:PGstGLWindow; callback:TGstGLWindowCB; data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgstgl;
procedure gst_gl_window_set_resize_callback(window:PGstGLWindow; callback:TGstGLWindowResizeCB; data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgstgl;
procedure gst_gl_window_set_close_callback(window:PGstGLWindow; callback:TGstGLWindowCB; data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgstgl;
procedure gst_gl_window_set_window_handle(window:PGstGLWindow; handle:Tguintptr);cdecl;external libgstgl;
function gst_gl_window_get_window_handle(window:PGstGLWindow):Tguintptr;cdecl;external libgstgl;
{ loop/events  }
procedure gst_gl_window_run(window:PGstGLWindow);cdecl;external libgstgl;
procedure gst_gl_window_quit(window:PGstGLWindow);cdecl;external libgstgl;
procedure gst_gl_window_send_message(window:PGstGLWindow; callback:TGstGLWindowCB; data:Tgpointer);cdecl;external libgstgl;
procedure gst_gl_window_send_message_async(window:PGstGLWindow; callback:TGstGLWindowCB; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgstgl;
{ navigation  }
procedure gst_gl_window_handle_events(window:PGstGLWindow; handle_events:Tgboolean);cdecl;external libgstgl;
procedure gst_gl_window_send_key_event(window:PGstGLWindow; event_type:Pchar; key_str:Pchar);cdecl;external libgstgl;
procedure gst_gl_window_send_mouse_event(window:PGstGLWindow; event_type:Pchar; button:longint; posx:Tdouble; posy:Tdouble);cdecl;external libgstgl;
procedure gst_gl_window_send_scroll_event(window:PGstGLWindow; posx:Tdouble; posy:Tdouble; delta_x:Tdouble; delta_y:Tdouble);cdecl;external libgstgl;
{ surfaces/rendering  }
procedure gst_gl_window_queue_resize(window:PGstGLWindow);cdecl;external libgstgl;
procedure gst_gl_window_draw(window:PGstGLWindow);cdecl;external libgstgl;
procedure gst_gl_window_show(window:PGstGLWindow);cdecl;external libgstgl;
procedure gst_gl_window_set_preferred_size(window:PGstGLWindow; width:Tgint; height:Tgint);cdecl;external libgstgl;
procedure gst_gl_window_get_surface_dimensions(window:PGstGLWindow; width:Pguint; height:Pguint);cdecl;external libgstgl;
function gst_gl_window_set_render_rectangle(window:PGstGLWindow; x:Tgint; y:Tgint; width:Tgint; height:Tgint):Tgboolean;cdecl;external libgstgl;
function gst_gl_window_controls_viewport(window:PGstGLWindow):Tgboolean;cdecl;external libgstgl;
{ subclass usage only  }
procedure gst_gl_window_resize(window:PGstGLWindow; width:Tguint; height:Tguint);cdecl;external libgstgl;
function gst_gl_window_get_context(window:PGstGLWindow):PGstGLContext;cdecl;external libgstgl;
function gst_gl_window_get_display(window:PGstGLWindow):Tguintptr;cdecl;external libgstgl;
function gst_gl_window_has_output_surface(window:PGstGLWindow):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_window_set_request_output_surface(window:PGstGLWindow; output_surface:Tgboolean);cdecl;external libgstgl;
function gst_gl_window_get_request_output_surface(window:PGstGLWindow):Tgboolean;cdecl;external libgstgl;
{$endif}
{ __GST_GL_WINDOW_H__  }

// === Konventiert am: 14-7-26 13:09:10 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_GL_WINDOW : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_WINDOW:=gst_gl_window_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW(obj : longint) : longint;
begin
  GST_GL_WINDOW:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_GL_WINDOW,GstGLWindow);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_CLASS(klass : longint) : longint;
begin
  GST_GL_WINDOW_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_GL_WINDOW,GstGLWindowClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_WINDOW(obj : longint) : longint;
begin
  GST_IS_GL_WINDOW:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_GL_WINDOW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_WINDOW_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_WINDOW_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_GL_WINDOW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_WINDOW_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_GL_WINDOW,GstGLWindowClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_LOCK(w : longint) : longint;
begin
  GST_GL_WINDOW_LOCK:=g_mutex_lock(@((GST_GL_WINDOW(w))^.lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_UNLOCK(w : longint) : longint;
begin
  GST_GL_WINDOW_UNLOCK:=g_mutex_unlock(@((GST_GL_WINDOW(w))^.lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_WINDOW_GET_LOCK(w : longint) : longint;
begin
  GST_GL_WINDOW_GET_LOCK:=@((GST_GL_WINDOW(w))^.lock);
end;

{ was #define dname def_expr }
function GST_GL_WINDOW_ERROR : longint; { return type might be wrong }
  begin
    GST_GL_WINDOW_ERROR:=gst_gl_window_error_quark;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_WINDOW_CB(f : longint) : TGstGLWindowCB;
begin
  GST_GL_WINDOW_CB:=TGstGLWindowCB(f);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_WINDOW_RESIZE_CB(f : longint) : TGstGLWindowResizeCB;
begin
  GST_GL_WINDOW_RESIZE_CB:=TGstGLWindowResizeCB(f);
end;


end.
