unit gstvkwindow;

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
{$ifndef __GST_VULKAN_WINDOW_H__}
{$define __GST_VULKAN_WINDOW_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_WINDOW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_WINDOW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_WINDOW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_GET_CLASS(obj : longint) : longint;

function gst_vulkan_window_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GST_VULKAN_WINDOW_LOCK:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_LOCK(w : longint) : longint;

{*
 * GST_VULKAN_WINDOW_UNLOCK:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_UNLOCK(w : longint) : longint;

{*
 * GST_VULKAN_WINDOW_GET_LOCK:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_GET_LOCK(w : longint) : longint;

{*
 * GST_VULKAN_WINDOW_ERROR:
 *
 * Since: 1.18
  }
{ was #define dname def_expr }
function GST_VULKAN_WINDOW_ERROR : longint; { return type might be wrong }

{*
 * gst_vulkan_window_error_quark:
 *
 * Since: 1.18
  }
function gst_vulkan_window_error_quark:TGQuark;cdecl;external libgstvulkan;
{*
 * GstVulkanWindowError:
 * @GST_VULKAN_WINDOW_ERROR_FAILED: failed
 * @GST_VULKAN_WINDOW_ERROR_OLD_LIBS: old libraries
 * @GST_VULKAN_WINDOW_ERROR_RESOURCE_UNAVAILABLE: resource unavailable
 *
 * Since: 1.18
  }
type
  PGstVulkanWindowError = ^TGstVulkanWindowError;
  TGstVulkanWindowError =  Longint;
  Const
    GST_VULKAN_WINDOW_ERROR_FAILED = 0;
    GST_VULKAN_WINDOW_ERROR_OLD_LIBS = 1;
    GST_VULKAN_WINDOW_ERROR_RESOURCE_UNAVAILABLE = 2;
;
{*
 * GstVulkanWindow:
 *
 * #GstVulkanWindow is an opaque struct and should only be accessed through the
 * provided api.
 *
 * Since: 1.18
  }
{< private > }
{  GMutex                  lock; }
type
  PGstVulkanWindow = ^TGstVulkanWindow;
  TGstVulkanWindow = record
      parent : TGstObject;
      display : PGstVulkanDisplay;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanWindowClass:
 * @parent_class: Parent class
 * @open: open the connection to the display
 * @close: close the connection to the display
 * @get_surface: retrieve the vulkan surface for this window
 * @get_presentation_support: retrieve whether this window supports presentation
 * @set_window_handle: set the external window handle to render into
 * @get_surface_dimensions: retrieve the current size of the window
 * @handle_event: set whether to handle extra window system events
 *
 * Since: 1.18
  }
{< private > }
  PGstVulkanWindowClass = ^TGstVulkanWindowClass;
  TGstVulkanWindowClass = record
      parent_class : TGstObjectClass;
      open : function (window:PGstVulkanWindow; error:PPGError):Tgboolean;cdecl;
      close : procedure (window:PGstVulkanWindow);cdecl;
      get_surface : function (window:PGstVulkanWindow; error:PPGError):TVkSurfaceKHR;cdecl;
      get_presentation_support : function (window:PGstVulkanWindow; device:PGstVulkanDevice; queue_family_idx:Tguint32):Tgboolean;cdecl;
      set_window_handle : procedure (window:PGstVulkanWindow; handle:Tguintptr);cdecl;
      get_surface_dimensions : procedure (window:PGstVulkanWindow; width:Pguint; height:Pguint);cdecl;
      handle_events : procedure (window:PGstVulkanWindow; handle_events:Tgboolean);cdecl;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanWindow, gst_object_unref) }

function gst_vulkan_window_new(display:PGstVulkanDisplay):PGstVulkanWindow;cdecl;external libgstvulkan;
function gst_vulkan_window_get_display(window:PGstVulkanWindow):PGstVulkanDisplay;cdecl;external libgstvulkan;
function gst_vulkan_window_get_surface(window:PGstVulkanWindow; error:PPGError):TVkSurfaceKHR;cdecl;external libgstvulkan;
function gst_vulkan_window_get_presentation_support(window:PGstVulkanWindow; device:PGstVulkanDevice; queue_family_idx:Tguint32):Tgboolean;cdecl;external libgstvulkan;
procedure gst_vulkan_window_get_surface_dimensions(window:PGstVulkanWindow; width:Pguint; height:Pguint);cdecl;external libgstvulkan;
procedure gst_vulkan_window_set_window_handle(window:PGstVulkanWindow; handle:Tguintptr);cdecl;external libgstvulkan;
procedure gst_vulkan_window_handle_events(window:PGstVulkanWindow; handle_events:Tgboolean);cdecl;external libgstvulkan;
procedure gst_vulkan_window_send_key_event(window:PGstVulkanWindow; event_type:Pchar; key_str:Pchar);cdecl;external libgstvulkan;
procedure gst_vulkan_window_send_mouse_event(window:PGstVulkanWindow; event_type:Pchar; button:longint; posx:Tdouble; posy:Tdouble);cdecl;external libgstvulkan;
function gst_vulkan_window_open(window:PGstVulkanWindow; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
procedure gst_vulkan_window_close(window:PGstVulkanWindow);cdecl;external libgstvulkan;
procedure gst_vulkan_window_resize(window:PGstVulkanWindow; width:Tgint; height:Tgint);cdecl;external libgstvulkan;
procedure gst_vulkan_window_redraw(window:PGstVulkanWindow);cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_WINDOW_H__  }

// === Konventiert am: 17-7-26 15:49:10 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_VULKAN_WINDOW : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_WINDOW:=gst_vulkan_window_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW(obj : longint) : longint;
begin
  GST_VULKAN_WINDOW:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_WINDOW,GstVulkanWindow);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_WINDOW_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_WINDOW,GstVulkanWindowClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_WINDOW(obj : longint) : longint;
begin
  GST_IS_VULKAN_WINDOW:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_WINDOW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_WINDOW_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_WINDOW_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_WINDOW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_WINDOW_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_WINDOW,GstVulkanWindowClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_LOCK(w : longint) : longint;
begin
  GST_VULKAN_WINDOW_LOCK:=g_mutex_lock(@((GST_VULKAN_WINDOW(w))^.lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_UNLOCK(w : longint) : longint;
begin
  GST_VULKAN_WINDOW_UNLOCK:=g_mutex_unlock(@((GST_VULKAN_WINDOW(w))^.lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_WINDOW_GET_LOCK(w : longint) : longint;
begin
  GST_VULKAN_WINDOW_GET_LOCK:=@((GST_VULKAN_WINDOW(w))^.lock);
end;

{ was #define dname def_expr }
function GST_VULKAN_WINDOW_ERROR : longint; { return type might be wrong }
  begin
    GST_VULKAN_WINDOW_ERROR:=gst_vulkan_window_error_quark;
  end;


end.
