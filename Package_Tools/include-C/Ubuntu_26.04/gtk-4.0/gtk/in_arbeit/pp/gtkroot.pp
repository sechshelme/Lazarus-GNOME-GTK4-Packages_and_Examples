
unit gtkroot;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkroot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkroot.h
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
PGdkDisplay  = ^GdkDisplay;
PGtkRoot  = ^GtkRoot;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_ROOT : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkRoot, gtk_root, GTK, ROOT, GtkWidget) }
function gtk_root_get_display(self:PGtkRoot):PGdkDisplay;cdecl;external;
procedure gtk_root_set_focus(self:PGtkRoot; focus:PGtkWidget);cdecl;external;
function gtk_root_get_focus(self:PGtkRoot):PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_ROOT : longint; { return type might be wrong }
  begin
    GTK_TYPE_ROOT:=gtk_root_get_type;
  end;


end.
