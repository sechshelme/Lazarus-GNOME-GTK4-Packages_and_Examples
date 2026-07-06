unit gtkboxlayout;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkBoxLayout, gtk_box_layout, GTK, BOX_LAYOUT, GtkLayoutManager) }
function gtk_box_layout_new(orientation:TGtkOrientation):PGtkLayoutManager;cdecl;external libgtk4;
procedure gtk_box_layout_set_homogeneous(box_layout:PGtkBoxLayout; homogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_box_layout_get_homogeneous(box_layout:PGtkBoxLayout):Tgboolean;cdecl;external libgtk4;
procedure gtk_box_layout_set_spacing(box_layout:PGtkBoxLayout; spacing:Tguint);cdecl;external libgtk4;
function gtk_box_layout_get_spacing(box_layout:PGtkBoxLayout):Tguint;cdecl;external libgtk4;
procedure gtk_box_layout_set_baseline_position(box_layout:PGtkBoxLayout; position:TGtkBaselinePosition);cdecl;external libgtk4;
function gtk_box_layout_get_baseline_position(box_layout:PGtkBoxLayout):TGtkBaselinePosition;cdecl;external libgtk4;
procedure gtk_box_layout_set_baseline_child(box_layout:PGtkBoxLayout; child:longint);cdecl;external libgtk4;
function gtk_box_layout_get_baseline_child(box_layout:PGtkBoxLayout):longint;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 13:54:34 ===

function GTK_TYPE_BOX_LAYOUT: TGType;
function GTK_BOX_LAYOUT(obj: Pointer): PGtkBoxLayout;
function GTK_IS_BOX_LAYOUT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_BOX_LAYOUT: TGType;
begin
  Result := gtk_box_layout_get_type;
end;

function GTK_BOX_LAYOUT(obj: Pointer): PGtkBoxLayout;
begin
  Result := PGtkBoxLayout(g_type_check_instance_cast(obj, GTK_TYPE_BOX_LAYOUT));
end;

function GTK_IS_BOX_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BOX_LAYOUT);
end;

type 
  PGtkBoxLayout = type Pointer;

  TGtkBoxLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkBoxLayoutClass = ^TGtkBoxLayoutClass;

function gtk_box_layout_get_type: TGType; cdecl; external libgxxxxxxx;



end.
