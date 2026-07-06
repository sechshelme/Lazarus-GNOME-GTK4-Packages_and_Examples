unit gtkfixedlayout;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkfixedlayout.h: Fixed positioning layout manager
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Copyright 2019 GNOME Foundation
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
(** unsupported pragma#pragma once*)
{$include <gtk/gtklayoutmanager.h>}

{ was #define dname def_expr }
function GTK_TYPE_FIXED_LAYOUT_CHILD : longint; { return type might be wrong }

{ GtkFixedLayout  }
{G_DECLARE_FINAL_TYPE (GtkFixedLayout, gtk_fixed_layout, GTK, FIXED_LAYOUT, GtkLayoutManager) }
function gtk_fixed_layout_new:PGtkLayoutManager;cdecl;external libgtk4;
{ GtkFixedLayoutChild  }
{G_DECLARE_FINAL_TYPE (GtkFixedLayoutChild, gtk_fixed_layout_child, GTK, FIXED_LAYOUT_CHILD, GtkLayoutChild) }
procedure gtk_fixed_layout_child_set_transform(child:PGtkFixedLayoutChild; transform:PGskTransform);cdecl;external libgtk4;
function gtk_fixed_layout_child_get_transform(child:PGtkFixedLayoutChild):PGskTransform;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:42 ===

function GTK_TYPE_FIXED_LAYOUT: TGType;
function GTK_FIXED_LAYOUT(obj: Pointer): PGtkFixedLayout;
function GTK_IS_FIXED_LAYOUT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FIXED_LAYOUT: TGType;
begin
  Result := gtk_fixed_layout_get_type;
end;

function GTK_FIXED_LAYOUT(obj: Pointer): PGtkFixedLayout;
begin
  Result := PGtkFixedLayout(g_type_check_instance_cast(obj, GTK_TYPE_FIXED_LAYOUT));
end;

function GTK_IS_FIXED_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FIXED_LAYOUT);
end;

type 
  PGtkFixedLayout = type Pointer;

  TGtkFixedLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkFixedLayoutClass = ^TGtkFixedLayoutClass;

function gtk_fixed_layout_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_FIXED_LAYOUT_CHILD : longint; { return type might be wrong }
  begin
    GTK_TYPE_FIXED_LAYOUT_CHILD:=gtk_fixed_layout_child_get_type;
  end;


end.
