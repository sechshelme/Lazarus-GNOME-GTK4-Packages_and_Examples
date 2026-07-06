unit gtkwindow;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkapplication.h>}
{$include <gtk/gtkaccelgroup.h>}
{$include <gtk/gtkwidget.h>}

type
  PGtkWindow = ^TGtkWindow;
  TGtkWindow = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkWindowClass:
 * @parent_class: The parent class.
 * @activate_focus: Activates the current focused widget within the window.
 * @activate_default: Activates the default widget for the window.
 * @keys_changed: Signal gets emitted when the set of accelerators or
 *   mnemonics that are associated with window changes.
 * @enable_debugging: Class handler for the `GtkWindow::enable-debugging`
 *   keybinding signal.
  }
{< public > }
{ G_SIGNAL_ACTION signals for keybindings  }
{*
   * GtkWindowClass::close_request:
   *
   * Class handler for the [signal@Window::close-request] signal.
   *
   * Returns: Whether the window should be destroyed
    }
{< private > }
  PGtkWindowClass = ^TGtkWindowClass;
  TGtkWindowClass = record
      parent_class : TGtkWidgetClass;
      activate_focus : procedure (window:PGtkWindow);cdecl;
      activate_default : procedure (window:PGtkWindow);cdecl;
      keys_changed : procedure (window:PGtkWindow);cdecl;
      enable_debugging : function (window:PGtkWindow; toggle:Tgboolean):Tgboolean;cdecl;
      close_request : function (window:PGtkWindow):Tgboolean;cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_window_get_type:TGType;cdecl;external libgtk4;
function gtk_window_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_window_set_title(window:PGtkWindow; title:Pchar);cdecl;external libgtk4;
function gtk_window_get_title(window:PGtkWindow):Pchar;cdecl;external libgtk4;
procedure gtk_window_set_startup_id(window:PGtkWindow; startup_id:Pchar);cdecl;external libgtk4;
procedure gtk_window_set_focus(window:PGtkWindow; focus:PGtkWidget);cdecl;external libgtk4;
function gtk_window_get_focus(window:PGtkWindow):PGtkWidget;cdecl;external libgtk4;
procedure gtk_window_set_default_widget(window:PGtkWindow; default_widget:PGtkWidget);cdecl;external libgtk4;
function gtk_window_get_default_widget(window:PGtkWindow):PGtkWidget;cdecl;external libgtk4;
procedure gtk_window_set_transient_for(window:PGtkWindow; parent:PGtkWindow);cdecl;external libgtk4;
function gtk_window_get_transient_for(window:PGtkWindow):PGtkWindow;cdecl;external libgtk4;
procedure gtk_window_set_destroy_with_parent(window:PGtkWindow; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_destroy_with_parent(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_hide_on_close(window:PGtkWindow; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_hide_on_close(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_mnemonics_visible(window:PGtkWindow; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_mnemonics_visible(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_focus_visible(window:PGtkWindow; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_focus_visible(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_resizable(window:PGtkWindow; resizable:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_resizable(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_display(window:PGtkWindow; display:PGdkDisplay);cdecl;external libgtk4;
function gtk_window_is_active(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_decorated(window:PGtkWindow; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_decorated(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_deletable(window:PGtkWindow; setting:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_deletable(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_set_icon_name(window:PGtkWindow; name:Pchar);cdecl;external libgtk4;
function gtk_window_get_icon_name(window:PGtkWindow):Pchar;cdecl;external libgtk4;
procedure gtk_window_set_default_icon_name(name:Pchar);cdecl;external libgtk4;
function gtk_window_get_default_icon_name:Pchar;cdecl;external libgtk4;
procedure gtk_window_set_auto_startup_notification(setting:Tgboolean);cdecl;external libgtk4;
{ If window is set modal, input will be grabbed when show and released when hide  }
procedure gtk_window_set_modal(window:PGtkWindow; modal:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_modal(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
function gtk_window_get_toplevels:PGListModel;cdecl;external libgtk4;
function gtk_window_list_toplevels:PGList;cdecl;external libgtk4;
procedure gtk_window_present(window:PGtkWindow);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_14_FOR(gtk_window_present) }
procedure gtk_window_present_with_time(window:PGtkWindow; timestamp:Tguint32);cdecl;external libgtk4;
procedure gtk_window_minimize(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_unminimize(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_maximize(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_unmaximize(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_fullscreen(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_unfullscreen(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_fullscreen_on_monitor(window:PGtkWindow; monitor:PGdkMonitor);cdecl;external libgtk4;
procedure gtk_window_close(window:PGtkWindow);cdecl;external libgtk4;
{ Set initial default size of the window (does not constrain user
 * resize operations)
  }
procedure gtk_window_set_default_size(window:PGtkWindow; width:longint; height:longint);cdecl;external libgtk4;
procedure gtk_window_get_default_size(window:PGtkWindow; width:Plongint; height:Plongint);cdecl;external libgtk4;
function gtk_window_get_group(window:PGtkWindow):PGtkWindowGroup;cdecl;external libgtk4;
function gtk_window_has_group(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
function gtk_window_get_application(window:PGtkWindow):PGtkApplication;cdecl;external libgtk4;
procedure gtk_window_set_application(window:PGtkWindow; application:PGtkApplication);cdecl;external libgtk4;
procedure gtk_window_set_child(window:PGtkWindow; child:PGtkWidget);cdecl;external libgtk4;
function gtk_window_get_child(window:PGtkWindow):PGtkWidget;cdecl;external libgtk4;
procedure gtk_window_set_titlebar(window:PGtkWindow; titlebar:PGtkWidget);cdecl;external libgtk4;
function gtk_window_get_titlebar(window:PGtkWindow):PGtkWidget;cdecl;external libgtk4;
function gtk_window_is_maximized(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
function gtk_window_is_fullscreen(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
function gtk_window_is_suspended(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
procedure gtk_window_destroy(window:PGtkWindow);cdecl;external libgtk4;
procedure gtk_window_set_interactive_debugging(enable:Tgboolean);cdecl;external libgtk4;
procedure gtk_window_set_handle_menubar_accel(window:PGtkWindow; handle_menubar_accel:Tgboolean);cdecl;external libgtk4;
function gtk_window_get_handle_menubar_accel(window:PGtkWindow):Tgboolean;cdecl;external libgtk4;
{*
 * GtkWindowGravity:
 * @GTK_WINDOW_GRAVITY_TOP_LEFT: The top left corner
 * @GTK_WINDOW_GRAVITY_TOP: The top edge
 * @GTK_WINDOW_GRAVITY_TOP_RIGHT: The top right corner
 * @GTK_WINDOW_GRAVITY_LEFT: The left edge
 * @GTK_WINDOW_GRAVITY_CENTER: The center pointer
 * @GTK_WINDOW_GRAVITY_RIGHT: The right edge
 * @GTK_WINDOW_GRAVITY_BOTTOM_LEFT: The bottom left corner
 * @GTK_WINDOW_GRAVITY_BOTTOM: the bottom edge
 * @GTK_WINDOW_GRAVITY_BOTTOM_RIGHT: The bottom right corner
 * @GTK_WINDOW_GRAVITY_TOP_START: The top left or top right corner,
 *   depending on the text direction
 * @GTK_WINDOW_GRAVITY_TOP_END: The top right or top left corner,
 *   depending on the text direction
 * @GTK_WINDOW_GRAVITY_START: The left or right edge,
 *   depending on the text direction
 * @GTK_WINDOW_GRAVITY_END: The right or left edge,
 *   depending on the text direction
 * @GTK_WINDOW_GRAVITY_BOTTOM_START: The bottom left or top right corner,
 *   depending on the text direction
 * @GTK_WINDOW_GRAVITY_BOTTOM_END: The bottom right or top left corner,
 *   depending on the text direction
 *
 * Determines which point or edge of a window is meant to remain fixed
 * when a window changes size.
 *
 * Since: 4.20
  }
type
  PGtkWindowGravity = ^TGtkWindowGravity;
  TGtkWindowGravity =  Longint;
  Const
    GTK_WINDOW_GRAVITY_TOP_LEFT = 0;
    GTK_WINDOW_GRAVITY_TOP = 1;
    GTK_WINDOW_GRAVITY_TOP_RIGHT = 2;
    GTK_WINDOW_GRAVITY_LEFT = 3;
    GTK_WINDOW_GRAVITY_CENTER = 4;
    GTK_WINDOW_GRAVITY_RIGHT = 5;
    GTK_WINDOW_GRAVITY_BOTTOM_LEFT = 6;
    GTK_WINDOW_GRAVITY_BOTTOM = 7;
    GTK_WINDOW_GRAVITY_BOTTOM_RIGHT = 8;
    GTK_WINDOW_GRAVITY_TOP_START = 9;
    GTK_WINDOW_GRAVITY_TOP_END = 10;
    GTK_WINDOW_GRAVITY_START = 11;
    GTK_WINDOW_GRAVITY_END = 12;
    GTK_WINDOW_GRAVITY_BOTTOM_START = 13;
    GTK_WINDOW_GRAVITY_BOTTOM_END = 14;
;

function gtk_window_get_gravity(window:PGtkWindow):TGtkWindowGravity;cdecl;external libgtk4;
procedure gtk_window_set_gravity(window:PGtkWindow; gravity:TGtkWindowGravity);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkWindow, g_object_unref) }
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkWindowGroup, g_object_unref) }

// === Konventiert am: 6-7-26 14:16:26 ===

function GTK_TYPE_WINDOW : TGType;
function GTK_WINDOW(obj : Pointer) : PGtkWindow;
function GTK_WINDOW_CLASS(klass : Pointer) : PGtkWindowClass;
function GTK_IS_WINDOW(obj : Pointer) : Tgboolean;
function GTK_IS_WINDOW_CLASS(klass : Pointer) : Tgboolean;
function GTK_WINDOW_GET_CLASS(obj : Pointer) : PGtkWindowClass;

implementation

function GTK_TYPE_WINDOW : TGType;
  begin
    GTK_TYPE_WINDOW:=gtk_window_get_type;
  end;

function GTK_WINDOW(obj : Pointer) : PGtkWindow;
begin
  Result := PGtkWindow(g_type_check_instance_cast(obj, GTK_TYPE_WINDOW));
end;

function GTK_WINDOW_CLASS(klass : Pointer) : PGtkWindowClass;
begin
  Result := PGtkWindowClass(g_type_check_class_cast(klass, GTK_TYPE_WINDOW));
end;

function GTK_IS_WINDOW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_WINDOW);
end;

function GTK_IS_WINDOW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_WINDOW);
end;

function GTK_WINDOW_GET_CLASS(obj : Pointer) : PGtkWindowClass;
begin
  Result := PGtkWindowClass(PGTypeInstance(obj)^.g_class);
end;



end.
