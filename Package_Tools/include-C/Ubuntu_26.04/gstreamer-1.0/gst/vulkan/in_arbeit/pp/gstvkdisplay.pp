
unit gstvkdisplay;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkdisplay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdisplay.h
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
PGList  = ^GList;
PGMainContext  = ^GMainContext;
PGMainLoop  = ^GMainLoop;
PGSource  = ^GSource;
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstQuery  = ^GstQuery;
PGstVulkanDisplay  = ^GstVulkanDisplay;
PGstVulkanDisplayClass  = ^GstVulkanDisplayClass;
PGstVulkanDisplayType  = ^GstVulkanDisplayType;
PGstVulkanInstance  = ^GstVulkanInstance;
PGstVulkanWindow  = ^GstVulkanWindow;
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
{$ifndef __GST_VULKAN_DISPLAY_H__}
{$define __GST_VULKAN_DISPLAY_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/gstvkwindow.h>}
{$include <gst/vulkan/gstvkinstance.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DISPLAY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_GET_CLASS(o : longint) : longint;

function gst_vulkan_display_get_type:TGType;cdecl;external;
{*
 * GST_VULKAN_DISPLAY_CAST
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_DISPLAY_CAST(obj : longint) : PGstVulkanDisplay;

{*
 * GST_VULKAN_DISPLAY_CONTEXT_TYPE_STR
 *
 * Since: 1.18
  }
const
  GST_VULKAN_DISPLAY_CONTEXT_TYPE_STR = 'gst.vulkan.display';  
type
{*
 * GstVulkanDisplayType:
 * @GST_VULKAN_DISPLAY_TYPE_NONE: no display
 * @GST_VULKAN_DISPLAY_TYPE_XCB: XCB display
 * @GST_VULKAN_DISPLAY_TYPE_WAYLAND: wayland display
 * @GST_VULKAN_DISPLAY_TYPE_COCOA: cocoa display for macOS
 * @GST_VULKAN_DISPLAY_TYPE_IOS: ios display
 * @GST_VULKAN_DISPLAY_TYPE_WIN32: win32 display
 * @GST_VULKAN_DISPLAY_TYPE_ANY: any display type
 *
 * Since: 1.18
  }

  PGstVulkanDisplayType = ^TGstVulkanDisplayType;
  TGstVulkanDisplayType =  Longint;
  Const
    GST_VULKAN_DISPLAY_TYPE_NONE = 0;
    GST_VULKAN_DISPLAY_TYPE_XCB = 1 shl 0;
    GST_VULKAN_DISPLAY_TYPE_WAYLAND = 1 shl 1;
    GST_VULKAN_DISPLAY_TYPE_COCOA = 1 shl 2;
    GST_VULKAN_DISPLAY_TYPE_IOS = 1 shl 3;
    GST_VULKAN_DISPLAY_TYPE_WIN32 = 1 shl 4;
    GST_VULKAN_DISPLAY_TYPE_ANDROID = 1 shl 5;
    GST_VULKAN_DISPLAY_TYPE_ANY = G_MAXUINT32;
;
{*
 * GstVulkanDisplay:
 *
 * The contents of a #GstVulkanDisplay are private and should only be accessed
 * through the provided API
 *
 * Since: 1.18
  }
{ <private>  }
{ <protected>  }
{ OBJECT lock  }
{ <private>  }
type
  PGstVulkanDisplay = ^TGstVulkanDisplay;
  TGstVulkanDisplay = record
      object : TGstObject;
      _type : TGstVulkanDisplayType;
      instance : PGstVulkanInstance;
      windows : PGList;
      main_context : PGMainContext;
      main_loop : PGMainLoop;
      event_source : PGSource;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDisplayClass:
 * @object_class: parent #GstObjectClass
 * @get_handle: get the native handle to the display
 * @create_window: create a window
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDisplayClass = ^TGstVulkanDisplayClass;
  TGstVulkanDisplayClass = record
      object_class : TGstObjectClass;
      get_handle : function (display:PGstVulkanDisplay):Tgpointer;cdecl;
      create_window : function (display:PGstVulkanDisplay):PGstVulkanWindow;cdecl;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanDisplay, gst_object_unref) }

function gst_vulkan_display_new(instance:PGstVulkanInstance):PGstVulkanDisplay;cdecl;external;
function gst_vulkan_display_new_with_type(instance:PGstVulkanInstance; _type:TGstVulkanDisplayType):PGstVulkanDisplay;cdecl;external;
function gst_vulkan_display_choose_type(instance:PGstVulkanInstance):TGstVulkanDisplayType;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_display_type_to_extension_string(_type:TGstVulkanDisplayType):Pgchar;cdecl;external;
function gst_vulkan_display_get_handle(display:PGstVulkanDisplay):Tgpointer;cdecl;external;
function gst_vulkan_display_get_handle_type(display:PGstVulkanDisplay):TGstVulkanDisplayType;cdecl;external;
function gst_vulkan_display_create_window(display:PGstVulkanDisplay):PGstVulkanWindow;cdecl;external;
function gst_context_get_vulkan_display(context:PGstContext; display:PPGstVulkanDisplay):Tgboolean;cdecl;external;
procedure gst_context_set_vulkan_display(context:PGstContext; display:PGstVulkanDisplay);cdecl;external;
function gst_vulkan_display_handle_context_query(element:PGstElement; query:PGstQuery; display:PGstVulkanDisplay):Tgboolean;cdecl;external;
function gst_vulkan_display_run_context_query(element:PGstElement; display:PPGstVulkanDisplay):Tgboolean;cdecl;external;
{ GstVulkanWindow usage only  }
function gst_vulkan_display_remove_window(display:PGstVulkanDisplay; window:PGstVulkanWindow):Tgboolean;cdecl;external;
function gst_vulkan_display_find_window(display:PGstVulkanDisplay; data:Tgpointer; compare_func:TGCompareFunc):PGstVulkanWindow;cdecl;external;
{$endif}
{ __GST_VULKAN_DISPLAY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DISPLAY : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DISPLAY:=gst_vulkan_display_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY(obj : longint) : longint;
begin
  GST_VULKAN_DISPLAY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_DISPLAY,GstVulkanDisplay);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_DISPLAY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_DISPLAY,GstVulkanDisplayClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY(obj : longint) : longint;
begin
  GST_IS_VULKAN_DISPLAY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_DISPLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_DISPLAY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_DISPLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_DISPLAY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_DISPLAY,GstVulkanDisplayClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_DISPLAY_CAST(obj : longint) : PGstVulkanDisplay;
begin
  GST_VULKAN_DISPLAY_CAST:=PGstVulkanDisplay(obj);
end;


end.
