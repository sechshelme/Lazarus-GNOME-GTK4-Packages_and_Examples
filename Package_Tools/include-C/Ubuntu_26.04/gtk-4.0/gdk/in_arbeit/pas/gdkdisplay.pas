unit gdkdisplay;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gdkdisplay.h
 *
 * Copyright 2001 Sun Microsystems Inc.
 *
 * Erwann Chenede <erwann.chenede@sun.com>
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdkevents.h>}
{$include <gdk/gdkseat.h>}
{$include <gdk/gdkmonitor.h>}

function gdk_display_get_type:TGType;cdecl;external libgtk4;
function gdk_display_open(display_name:Pchar):PGdkDisplay;cdecl;external libgtk4;
function gdk_display_get_name(display:PGdkDisplay):Pchar;cdecl;external libgtk4;
function gdk_display_device_is_grabbed(display:PGdkDisplay; device:PGdkDevice):Tgboolean;cdecl;external libgtk4;
procedure gdk_display_beep(display:PGdkDisplay);cdecl;external libgtk4;
procedure gdk_display_sync(display:PGdkDisplay);cdecl;external libgtk4;
procedure gdk_display_flush(display:PGdkDisplay);cdecl;external libgtk4;
procedure gdk_display_close(display:PGdkDisplay);cdecl;external libgtk4;
function gdk_display_is_closed(display:PGdkDisplay):Tgboolean;cdecl;external libgtk4;
function gdk_display_is_composited(display:PGdkDisplay):Tgboolean;cdecl;external libgtk4;
function gdk_display_is_rgba(display:PGdkDisplay):Tgboolean;cdecl;external libgtk4;
function gdk_display_supports_shadow_width(display:PGdkDisplay):Tgboolean;cdecl;external libgtk4;
function gdk_display_supports_input_shapes(display:PGdkDisplay):Tgboolean;cdecl;external libgtk4;
function gdk_display_prepare_gl(self:PGdkDisplay; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gdk_display_create_gl_context(self:PGdkDisplay; error:PPGError):PGdkGLContext;cdecl;external libgtk4;
function gdk_display_get_default:PGdkDisplay;cdecl;external libgtk4;
function gdk_display_get_clipboard(display:PGdkDisplay):PGdkClipboard;cdecl;external libgtk4;
function gdk_display_get_primary_clipboard(display:PGdkDisplay):PGdkClipboard;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(gdk_toplevel_set_startup_id) }
procedure gdk_display_notify_startup_complete(display:PGdkDisplay; startup_id:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gdk_display_get_startup_notification_id(display:PGdkDisplay):Pchar;cdecl;external libgtk4;
function gdk_display_get_app_launch_context(display:PGdkDisplay):PGdkAppLaunchContext;cdecl;external libgtk4;
function gdk_display_get_default_seat(display:PGdkDisplay):PGdkSeat;cdecl;external libgtk4;
function gdk_display_list_seats(display:PGdkDisplay):PGList;cdecl;external libgtk4;
(* error 
GListModel * gdk_display_get_monitors          (GdkDisplay *self) G_GNUC_PURE;
 in declarator_list *)
  var
 : TGListModel;

function gdk_display_get_monitor_at_surface(display:PGdkDisplay; surface:PGdkSurface):PGdkMonitor;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gdk_display_put_event(display:PGdkDisplay; event:PGdkEvent);cdecl;external libgtk4;
function gdk_display_map_keyval(display:PGdkDisplay; keyval:Tguint; keys:PPGdkKeymapKey; n_keys:Plongint):Tgboolean;cdecl;external libgtk4;
function gdk_display_map_keycode(display:PGdkDisplay; keycode:Tguint; keys:PPGdkKeymapKey; keyvals:PPguint; n_entries:Plongint):Tgboolean;cdecl;external libgtk4;
function gdk_display_translate_key(display:PGdkDisplay; keycode:Tguint; state:TGdkModifierType; group:longint; keyval:Pguint; 
           effective_group:Plongint; level:Plongint; consumed:PGdkModifierType):Tgboolean;cdecl;external libgtk4;
function gdk_display_get_setting(display:PGdkDisplay; name:Pchar; value:PGValue):Tgboolean;cdecl;external libgtk4;
function gdk_display_get_dmabuf_formats(display:PGdkDisplay):PGdkDmabufFormats;cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkDisplay, g_object_unref) }

// === Konventiert am: 2-7-26 19:12:23 ===

function GDK_TYPE_DISPLAY : TGType;
function GDK_DISPLAY(obj : Pointer) : PGdkDisplay;
function GDK_IS_DISPLAY(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DISPLAY : TGType;
  begin
    GDK_TYPE_DISPLAY:=gdk_display_get_type;
  end;

function GDK_DISPLAY(obj : Pointer) : PGdkDisplay;
begin
  Result := PGdkDisplay(g_type_check_instance_cast(obj, GDK_TYPE_DISPLAY));
end;

function GDK_IS_DISPLAY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DISPLAY);
end;



end.
