unit gtkshortcutsshortcut;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkshortcutsshortcutprivate.h
 *
 * Copyright (C) 2015 Christian Hergert <christian@hergert.me>
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Library General Public License as
 *  published by the Free Software Foundation; either version 2 of the
 *  License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public
 *  License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}

type
{*
 * GtkShortcutType:
 * @GTK_SHORTCUT_ACCELERATOR:
 *   The shortcut is a keyboard accelerator. The GtkShortcutsShortcut:accelerator
 *   property will be used.
 * @GTK_SHORTCUT_GESTURE_PINCH:
 *   The shortcut is a pinch gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE_STRETCH:
 *   The shortcut is a stretch gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE:
 *   The shortcut is a clockwise rotation gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE:
 *   The shortcut is a counterclockwise rotation gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT:
 *   The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT:
 *   The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE:
 *   The shortcut is a gesture. The GtkShortcutsShortcut:icon property will be
 *   used.
 * @GTK_SHORTCUT_GESTURE_SWIPE_LEFT:
 *   The shortcut is a swipe gesture. GTK provides an icon and subtitle.
 * @GTK_SHORTCUT_GESTURE_SWIPE_RIGHT:
 *   The shortcut is a swipe gesture. GTK provides an icon and subtitle.
 *
 * GtkShortcutType specifies the kind of shortcut that is being described.
 *
 * More values may be added to this enumeration over time.
  }

  PGtkShortcutType = ^TGtkShortcutType;
  TGtkShortcutType =  Longint;
  Const
    GTK_SHORTCUT_ACCELERATOR = 0;
    GTK_SHORTCUT_GESTURE_PINCH = 1;
    GTK_SHORTCUT_GESTURE_STRETCH = 2;
    GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE = 3;
    GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE = 4;
    GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT = 5;
    GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT = 6;
    GTK_SHORTCUT_GESTURE = 7;
    GTK_SHORTCUT_GESTURE_SWIPE_LEFT = 8;
    GTK_SHORTCUT_GESTURE_SWIPE_RIGHT = 9;
;

function gtk_shortcuts_shortcut_get_type:TGType;cdecl;external libgtk4;

// === Konventiert am: 9-7-26 19:49:42 ===

function GTK_TYPE_SHORTCUTS_SHORTCUT : TGType;
function GTK_SHORTCUTS_SHORTCUT(obj : Pointer) : PGtkShortcutsShortcut;
function GTK_IS_SHORTCUTS_SHORTCUT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SHORTCUTS_SHORTCUT : TGType;
  begin
    GTK_TYPE_SHORTCUTS_SHORTCUT:=gtk_shortcuts_shortcut_get_type;
  end;

function GTK_SHORTCUTS_SHORTCUT(obj : Pointer) : PGtkShortcutsShortcut;
begin
  Result := PGtkShortcutsShortcut(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUTS_SHORTCUT));
end;

function GTK_IS_SHORTCUTS_SHORTCUT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SHORTCUTS_SHORTCUT);
end;



end.
