unit gdksurface;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdkevents.h>}
{$include <gdk/gdkframeclock.h>}
{$include <gdk/gdkmonitor.h>}
{$include <gdk/gdkpopuplayout.h>}
type

function gdk_surface_get_type:TGType;cdecl;external libgtk4;
function gdk_surface_new_toplevel(display:PGdkDisplay):PGdkSurface;cdecl;external libgtk4;
function gdk_surface_new_popup(parent:PGdkSurface; autohide:Tgboolean):PGdkSurface;cdecl;external libgtk4;
procedure gdk_surface_destroy(surface:PGdkSurface);cdecl;external libgtk4;
function gdk_surface_is_destroyed(surface:PGdkSurface):Tgboolean;cdecl;external libgtk4;
function gdk_surface_get_display(surface:PGdkSurface):PGdkDisplay;cdecl;external libgtk4;
procedure gdk_surface_hide(surface:PGdkSurface);cdecl;external libgtk4;
procedure gdk_surface_set_input_region(surface:PGdkSurface; region:Pcairo_region_t);cdecl;external libgtk4;
function gdk_surface_get_mapped(surface:PGdkSurface):Tgboolean;cdecl;external libgtk4;
procedure gdk_surface_set_cursor(surface:PGdkSurface; cursor:PGdkCursor);cdecl;external libgtk4;
function gdk_surface_get_cursor(surface:PGdkSurface):PGdkCursor;cdecl;external libgtk4;
procedure gdk_surface_set_device_cursor(surface:PGdkSurface; device:PGdkDevice; cursor:PGdkCursor);cdecl;external libgtk4;
function gdk_surface_get_device_cursor(surface:PGdkSurface; device:PGdkDevice):PGdkCursor;cdecl;external libgtk4;
function gdk_surface_get_width(surface:PGdkSurface):longint;cdecl;external libgtk4;
function gdk_surface_get_height(surface:PGdkSurface):longint;cdecl;external libgtk4;
function gdk_surface_translate_coordinates(from:PGdkSurface; to:PGdkSurface; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external libgtk4;
function gdk_surface_get_scale_factor(surface:PGdkSurface):longint;cdecl;external libgtk4;
function gdk_surface_get_scale(surface:PGdkSurface):Tdouble;cdecl;external libgtk4;
function gdk_surface_get_device_position(surface:PGdkSurface; device:PGdkDevice; x:Pdouble; y:Pdouble; mask:PGdkModifierType):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12 }
function gdk_surface_create_similar_surface(surface:PGdkSurface; content:Tcairo_content_t; width:longint; height:longint):Pcairo_surface_t;cdecl;external libgtk4;
procedure gdk_surface_beep(surface:PGdkSurface);cdecl;external libgtk4;
procedure gdk_surface_queue_render(surface:PGdkSurface);cdecl;external libgtk4;
procedure gdk_surface_request_layout(surface:PGdkSurface);cdecl;external libgtk4;
function gdk_surface_get_frame_clock(surface:PGdkSurface):PGdkFrameClock;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16 }
procedure gdk_surface_set_opaque_region(surface:PGdkSurface; region:Pcairo_region_t);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_18 }
function gdk_surface_create_cairo_context(surface:PGdkSurface):PGdkCairoContext;cdecl;external libgtk4;
function gdk_surface_create_gl_context(surface:PGdkSurface; error:PPGError):PGdkGLContext;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_14 }
function gdk_surface_create_vulkan_context(surface:PGdkSurface; error:PPGError):PGdkVulkanContext;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GdkSurface, g_object_unref) }

// === Konventiert am: 2-7-26 19:26:10 ===

function GDK_TYPE_SURFACE : TGType;
function GDK_SURFACE(obj : Pointer) : PGdkSurface;
function GDK_SURFACE_CLASS(klass : Pointer) : PGdkSurfaceClass;
function GDK_IS_SURFACE(obj : Pointer) : Tgboolean;
function GDK_IS_SURFACE_CLASS(klass : Pointer) : Tgboolean;
function GDK_SURFACE_GET_CLASS(obj : Pointer) : PGdkSurfaceClass;

implementation

function GDK_TYPE_SURFACE : TGType;
  begin
    GDK_TYPE_SURFACE:=gdk_surface_get_type;
  end;

function GDK_SURFACE(obj : Pointer) : PGdkSurface;
begin
  Result := PGdkSurface(g_type_check_instance_cast(obj, GDK_TYPE_SURFACE));
end;

function GDK_SURFACE_CLASS(klass : Pointer) : PGdkSurfaceClass;
begin
  Result := PGdkSurfaceClass(g_type_check_class_cast(klass, GDK_TYPE_SURFACE));
end;

function GDK_IS_SURFACE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_SURFACE);
end;

function GDK_IS_SURFACE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GDK_TYPE_SURFACE);
end;

function GDK_SURFACE_GET_CLASS(obj : Pointer) : PGdkSurfaceClass;
begin
  Result := PGdkSurfaceClass(PGTypeInstance(obj)^.g_class);
end;



end.
