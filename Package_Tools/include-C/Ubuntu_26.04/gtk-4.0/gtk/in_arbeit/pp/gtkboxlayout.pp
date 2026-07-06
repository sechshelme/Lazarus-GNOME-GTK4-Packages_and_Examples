
unit gtkboxlayout;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkboxlayout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkboxlayout.h
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
PGtkBoxLayout  = ^GtkBoxLayout;
PGtkLayoutManager  = ^GtkLayoutManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkboxlayout.h: Box layout manager
 *
 * Copyright 2019  GNOME Foundation
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtklayoutmanager.h>}

{ was #define dname def_expr }
function GTK_TYPE_BOX_LAYOUT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkBoxLayout, gtk_box_layout, GTK, BOX_LAYOUT, GtkLayoutManager) }
function gtk_box_layout_new(orientation:TGtkOrientation):PGtkLayoutManager;cdecl;external;
procedure gtk_box_layout_set_homogeneous(box_layout:PGtkBoxLayout; homogeneous:Tgboolean);cdecl;external;
function gtk_box_layout_get_homogeneous(box_layout:PGtkBoxLayout):Tgboolean;cdecl;external;
procedure gtk_box_layout_set_spacing(box_layout:PGtkBoxLayout; spacing:Tguint);cdecl;external;
function gtk_box_layout_get_spacing(box_layout:PGtkBoxLayout):Tguint;cdecl;external;
procedure gtk_box_layout_set_baseline_position(box_layout:PGtkBoxLayout; position:TGtkBaselinePosition);cdecl;external;
function gtk_box_layout_get_baseline_position(box_layout:PGtkBoxLayout):TGtkBaselinePosition;cdecl;external;
procedure gtk_box_layout_set_baseline_child(box_layout:PGtkBoxLayout; child:longint);cdecl;external;
function gtk_box_layout_get_baseline_child(box_layout:PGtkBoxLayout):longint;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_BOX_LAYOUT : longint; { return type might be wrong }
  begin
    GTK_TYPE_BOX_LAYOUT:=gtk_box_layout_get_type;
  end;


end.
