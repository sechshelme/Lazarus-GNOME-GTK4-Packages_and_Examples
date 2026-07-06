
unit gtkdebug;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkdebug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkdebug.h
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
PGtkDebugFlags  = ^GtkDebugFlags;
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
{$include <glib.h>}
{$include <gdk/gdk.h>}
{*
 * GtkDebugFlags:
 * @GTK_DEBUG_TEXT: Information about GtkTextView
 * @GTK_DEBUG_TREE: Information about GtkTreeView
 * @GTK_DEBUG_KEYBINDINGS: Information about keyboard shortcuts
 * @GTK_DEBUG_MODULES: Information about modules and extensions
 * @GTK_DEBUG_GEOMETRY: Information about size allocation
 * @GTK_DEBUG_ICONTHEME: Information about icon themes
 * @GTK_DEBUG_PRINTING: Information about printing
 * @GTK_DEBUG_BUILDER_TRACE: Trace GtkBuilder operation
 * @GTK_DEBUG_SIZE_REQUEST: Information about size requests
 * @GTK_DEBUG_NO_CSS_CACHE: Disable the style property cache
 * @GTK_DEBUG_INTERACTIVE: Open the GTK inspector
 * @GTK_DEBUG_ACTIONS: Information about actions and menu models
 * @GTK_DEBUG_LAYOUT: Information from layout managers
 * @GTK_DEBUG_SNAPSHOT: Include debug render nodes in the generated snapshots
 * @GTK_DEBUG_CONSTRAINTS: Information from the constraints solver
 * @GTK_DEBUG_BUILDER_OBJECTS: Log unused GtkBuilder objects
 * @GTK_DEBUG_A11Y: Information about accessibility state changes
 *
 * Flags to use with gtk_set_debug_flags().
 *
 * Settings these flags causes GTK to print out different
 * types of debugging information. Some of these flags are
 * only available when GTK has been configured with `-Ddebug=true`.
  }
{*
 * GTK_DEBUG_ICONFALLBACK:
 *
 * Information about icon fallback.
 *
 * Since: 4.2
  }
{*
 * GTK_DEBUG_INVERT_TEXT_DIR:
 *
 * Inverts the default text-direction.
 *
 * Since: 4.8
  }
{*
 * GTK_DEBUG_CSS:
 *
 * Information about deprecated CSS features.
 *
 * Since: 4.16
  }
{*
 * GTK_DEBUG_BUILDER:
 *
 * Information about deprecated GtkBuilder features.
 *
 * Since: 4.18
  }
{*
  * GTK_DEBUG_TOUCHSCREEN:
  *
  * Show touch UI elements for pointer events.
  *
  * Since: 4.20
   }
{*
 * GTK_DEBUG_SESSION:
 *
 * Information about session saving.
 *
 * Since: 4.22
  }
type
  PGtkDebugFlags = ^TGtkDebugFlags;
  TGtkDebugFlags =  Longint;
  Const
    GTK_DEBUG_TEXT = 1 shl 0;
    GTK_DEBUG_TREE = 1 shl 1;
    GTK_DEBUG_KEYBINDINGS = 1 shl 2;
    GTK_DEBUG_MODULES = 1 shl 3;
    GTK_DEBUG_GEOMETRY = 1 shl 4;
    GTK_DEBUG_ICONTHEME = 1 shl 5;
    GTK_DEBUG_PRINTING = 1 shl 6;
    GTK_DEBUG_BUILDER_TRACE = 1 shl 7;
    GTK_DEBUG_SIZE_REQUEST = 1 shl 8;
    GTK_DEBUG_NO_CSS_CACHE = 1 shl 9;
    GTK_DEBUG_INTERACTIVE = 1 shl 10;
    GTK_DEBUG_TOUCHSCREEN = 1 shl 11;
    GTK_DEBUG_ACTIONS = 1 shl 12;
    GTK_DEBUG_LAYOUT = 1 shl 13;
    GTK_DEBUG_SNAPSHOT = 1 shl 14;
    GTK_DEBUG_CONSTRAINTS = 1 shl 15;
    GTK_DEBUG_BUILDER_OBJECTS = 1 shl 16;
    GTK_DEBUG_A11Y = 1 shl 17;
    GTK_DEBUG_ICONFALLBACK = 1 shl 18;
    GTK_DEBUG_INVERT_TEXT_DIR = 1 shl 19;
    GTK_DEBUG_CSS = 1 shl 20;
    GTK_DEBUG_BUILDER = 1 shl 21;
    GTK_DEBUG_SESSION = 1 shl 22;
;
{*
 * GTK_DEBUG_CHECK:
 * @type: type to check
 *
 * Whether the `type` debug flag is set.
 * }
{#define GTK_DEBUG_CHECK(type) G_UNLIKELY (gtk_get_debug_flags () & GTK_DEBUG_##type) }

function gtk_get_debug_flags:TGtkDebugFlags;cdecl;external;
procedure gtk_set_debug_flags(flags:TGtkDebugFlags);cdecl;external;

implementation


end.
