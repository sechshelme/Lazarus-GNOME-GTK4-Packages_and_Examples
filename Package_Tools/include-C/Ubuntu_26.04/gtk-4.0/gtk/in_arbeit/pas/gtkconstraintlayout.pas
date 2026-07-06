unit gtkconstraintlayout;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkconstraintlayout.h: Layout manager using constraints
 * Copyright 2019  GNOME Foundation
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
 * Author: Emmanuele Bassi
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtklayoutmanager.h>}
{$include <gtk/gtkconstraint.h>}
{$include <gtk/gtkconstraintguide.h>}

{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT_LAYOUT_CHILD : longint; { return type might be wrong }

{ was #define dname def_expr }
function GTK_CONSTRAINT_VFL_PARSER_ERROR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkConstraintLayoutChild, gtk_constraint_layout_child, GTK, CONSTRAINT_LAYOUT_CHILD, GtkLayoutChild) }
{G_DECLARE_FINAL_TYPE (GtkConstraintLayout, gtk_constraint_layout, GTK, CONSTRAINT_LAYOUT, GtkLayoutManager) }
function gtk_constraint_vfl_parser_error_quark:TGQuark;cdecl;external libgtk4;
function gtk_constraint_layout_new:PGtkLayoutManager;cdecl;external libgtk4;
procedure gtk_constraint_layout_add_constraint(layout:PGtkConstraintLayout; constraint:PGtkConstraint);cdecl;external libgtk4;
procedure gtk_constraint_layout_remove_constraint(layout:PGtkConstraintLayout; constraint:PGtkConstraint);cdecl;external libgtk4;
procedure gtk_constraint_layout_add_guide(layout:PGtkConstraintLayout; guide:PGtkConstraintGuide);cdecl;external libgtk4;
procedure gtk_constraint_layout_remove_guide(layout:PGtkConstraintLayout; guide:PGtkConstraintGuide);cdecl;external libgtk4;
procedure gtk_constraint_layout_remove_all_constraints(layout:PGtkConstraintLayout);cdecl;external libgtk4;
function gtk_constraint_layout_add_constraints_from_description(layout:PGtkConstraintLayout; lines:PPchar; n_lines:Tgsize; hspacing:longint; vspacing:longint; 
           error:PPGError; first_view:Pchar; args:array of const):PGList;cdecl;external libgtk4;
function gtk_constraint_layout_add_constraints_from_description(layout:PGtkConstraintLayout; lines:PPchar; n_lines:Tgsize; hspacing:longint; vspacing:longint; 
           error:PPGError; first_view:Pchar):PGList;cdecl;external libgtk4;
function gtk_constraint_layout_add_constraints_from_descriptionv(layout:PGtkConstraintLayout; lines:PPchar; n_lines:Tgsize; hspacing:longint; vspacing:longint; 
           views:PGHashTable; error:PPGError):PGList;cdecl;external libgtk4;
function gtk_constraint_layout_observe_constraints(layout:PGtkConstraintLayout):PGListModel;cdecl;external libgtk4;
function gtk_constraint_layout_observe_guides(layout:PGtkConstraintLayout):PGListModel;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:08:47 ===

function GTK_TYPE_CONSTRAINT_LAYOUT_CHILD: TGType;
function GTK_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): PGtkConstraintLayoutChild;
function GTK_IS_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CONSTRAINT_LAYOUT_CHILD: TGType;
begin
  Result := gtk_constraint_layout_child_get_type;
end;

function GTK_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): PGtkConstraintLayoutChild;
begin
  Result := PGtkConstraintLayoutChild(g_type_check_instance_cast(obj, GTK_TYPE_CONSTRAINT_LAYOUT_CHILD));
end;

function GTK_IS_CONSTRAINT_LAYOUT_CHILD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CONSTRAINT_LAYOUT_CHILD);
end;

type 
  PGtkConstraintLayoutChild = type Pointer;

  TGtkConstraintLayoutChildClass = record
    parent_class: TGtkLayoutChildClass;
  end;
  PGtkConstraintLayoutChildClass = ^TGtkConstraintLayoutChildClass;

function gtk_constraint_layout_child_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT_LAYOUT_CHILD : longint; { return type might be wrong }
  begin
    GTK_TYPE_CONSTRAINT_LAYOUT_CHILD:=gtk_constraint_layout_child_get_type;
  end;

{ was #define dname def_expr }
function GTK_CONSTRAINT_VFL_PARSER_ERROR : longint; { return type might be wrong }
  begin
    GTK_CONSTRAINT_VFL_PARSER_ERROR:=gtk_constraint_vfl_parser_error_quark;
  end;


end.
