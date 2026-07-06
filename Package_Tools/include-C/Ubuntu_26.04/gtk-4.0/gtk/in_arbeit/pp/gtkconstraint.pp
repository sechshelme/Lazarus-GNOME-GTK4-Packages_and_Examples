
unit gtkconstraint;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkconstraint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkconstraint.h
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
PGtkConstraint  = ^GtkConstraint;
PGtkConstraintTarget  = ^GtkConstraintTarget;
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

{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT_TARGET : longint; { return type might be wrong }

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
           multiplier:Tdouble; constant:Tdouble; strength:longint):PGtkConstraint;cdecl;external;
function gtk_constraint_new_constant(target:Tgpointer; target_attribute:TGtkConstraintAttribute; relation:TGtkConstraintRelation; constant:Tdouble; strength:longint):PGtkConstraint;cdecl;external;
function gtk_constraint_get_target(constraint:PGtkConstraint):PGtkConstraintTarget;cdecl;external;
function gtk_constraint_get_target_attribute(constraint:PGtkConstraint):TGtkConstraintAttribute;cdecl;external;
function gtk_constraint_get_source(constraint:PGtkConstraint):PGtkConstraintTarget;cdecl;external;
function gtk_constraint_get_source_attribute(constraint:PGtkConstraint):TGtkConstraintAttribute;cdecl;external;
function gtk_constraint_get_relation(constraint:PGtkConstraint):TGtkConstraintRelation;cdecl;external;
function gtk_constraint_get_multiplier(constraint:PGtkConstraint):Tdouble;cdecl;external;
function gtk_constraint_get_constant(constraint:PGtkConstraint):Tdouble;cdecl;external;
function gtk_constraint_get_strength(constraint:PGtkConstraint):longint;cdecl;external;
function gtk_constraint_is_required(constraint:PGtkConstraint):Tgboolean;cdecl;external;
function gtk_constraint_is_attached(constraint:PGtkConstraint):Tgboolean;cdecl;external;
function gtk_constraint_is_constant(constraint:PGtkConstraint):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT_TARGET : longint; { return type might be wrong }
  begin
    GTK_TYPE_CONSTRAINT_TARGET:=gtk_constraint_target_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_CONSTRAINT : longint; { return type might be wrong }
  begin
    GTK_TYPE_CONSTRAINT:=gtk_constraint_get_type;
  end;


end.
