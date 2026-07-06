unit gtkconstraint;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkconstraint.h: Constraint between two widgets
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
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkenums.h>}
type

{*
 * GtkConstraintTarget:
 *
 * Makes it possible to use an object as source or target in a
 * [class@Gtk.Constraint].
 *
 * Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
  }
{ G_DECLARE_INTERFACE (GtkConstraintTarget, gtk_constraint_target, GTK, CONSTRAINT_TARGET, GObject) }
{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (GtkConstraint, gtk_constraint, GTK, CONSTRAINT, GObject) }
function gtk_constraint_new(target:Tgpointer; target_attribute:TGtkConstraintAttribute; relation:TGtkConstraintRelation; source:Tgpointer; source_attribute:TGtkConstraintAttribute; 
           multiplier:Tdouble; constant:Tdouble; strength:longint):PGtkConstraint;cdecl;external libgtk4;
function gtk_constraint_new_constant(target:Tgpointer; target_attribute:TGtkConstraintAttribute; relation:TGtkConstraintRelation; constant:Tdouble; strength:longint):PGtkConstraint;cdecl;external libgtk4;
function gtk_constraint_get_target(constraint:PGtkConstraint):PGtkConstraintTarget;cdecl;external libgtk4;
function gtk_constraint_get_target_attribute(constraint:PGtkConstraint):TGtkConstraintAttribute;cdecl;external libgtk4;
function gtk_constraint_get_source(constraint:PGtkConstraint):PGtkConstraintTarget;cdecl;external libgtk4;
function gtk_constraint_get_source_attribute(constraint:PGtkConstraint):TGtkConstraintAttribute;cdecl;external libgtk4;
function gtk_constraint_get_relation(constraint:PGtkConstraint):TGtkConstraintRelation;cdecl;external libgtk4;
function gtk_constraint_get_multiplier(constraint:PGtkConstraint):Tdouble;cdecl;external libgtk4;
function gtk_constraint_get_constant(constraint:PGtkConstraint):Tdouble;cdecl;external libgtk4;
function gtk_constraint_get_strength(constraint:PGtkConstraint):longint;cdecl;external libgtk4;
function gtk_constraint_is_required(constraint:PGtkConstraint):Tgboolean;cdecl;external libgtk4;
function gtk_constraint_is_attached(constraint:PGtkConstraint):Tgboolean;cdecl;external libgtk4;
function gtk_constraint_is_constant(constraint:PGtkConstraint):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:01:54 ===

function GTK_TYPE_CONSTRAINT_TARGET: TGType;
function GTK_CONSTRAINT_TARGET(obj: Pointer): PGtkConstraintTarget;
function GTK_IS_CONSTRAINT_TARGET(obj: Pointer): Tgboolean;
function GTK_CONSTRAINT_TARGET_GET_IFACE(obj: Pointer): PGtkConstraintTargetInterface;

implementation

function GTK_TYPE_CONSTRAINT_TARGET: TGType;
begin
  Result := gtk_constraint_target_get_type;
end;

function GTK_CONSTRAINT_TARGET(obj: Pointer): PGtkConstraintTarget;
begin
  Result := PGtkConstraintTarget(g_type_check_instance_cast(obj, GTK_TYPE_CONSTRAINT_TARGET));
end;

function GTK_IS_CONSTRAINT_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CONSTRAINT_TARGET);
end;

function GTK_CONSTRAINT_TARGET_GET_IFACE(obj: Pointer): PGtkConstraintTargetInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_CONSTRAINT_TARGET);
end;

type 
  PGtkConstraintTarget = type Pointer;

  PGtkConstraintTargetInterface = type Pointer

function gtk_constraint_target_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT : longint; { return type might be wrong }
  begin
    GTK_TYPE_CONSTRAINT:=gtk_constraint_get_type;
  end;


end.
