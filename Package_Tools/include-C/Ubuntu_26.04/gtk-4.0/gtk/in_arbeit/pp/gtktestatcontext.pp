
unit gtktestatcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktestatcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktestatcontext.h
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
Pchar  = ^char;
PGtkAccessible  = ^GtkAccessible;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktestatcontext.h: Test AT context
 *
 * Copyright 2020  GNOME Foundation
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkatcontext.h>}
{*
 * gtk_test_accessible_assert_role:
 * @accessible: a `GtkAccessible`
 * @role: a `GtkAccessibleRole`
 *
 * Checks whether a `GtkAccessible` implementation has the given @role,
 * and raises an assertion if the condition is failed.
  }
{*
 * gtk_test_accessible_assert_property:
 * @accessible: a `GtkAccessible`
 * @property: a `GtkAccessibleProperty`
 * @...: the value of @property
 *
 * Checks whether a `GtkAccessible` implementation has its accessible
 * property set to the expected value, and raises an assertion if the
 * condition is not satisfied.
  }
{*
 * gtk_test_accessible_assert_relation:
 * @accessible: a `GtkAccessible`
 * @relation: a `GtkAccessibleRelation`
 * @...: the expected value of @relation
 *
 * Checks whether a `GtkAccessible` implementation has its accessible
 * relation set to the expected value, and raises an assertion if the
 * condition is not satisfied.
  }
{*
 * gtk_test_accessible_assert_state:
 * @accessible: a `GtkAccessible`
 * @state: a `GtkAccessibleRelation`
 * @...: the expected value of @state
 *
 * Checks whether a `GtkAccessible` implementation has its accessible
 * state set to the expected value, and raises an assertion if the
 * condition is not satisfied.
  }

function gtk_test_accessible_has_role(accessible:PGtkAccessible; role:TGtkAccessibleRole):Tgboolean;cdecl;external;
function gtk_test_accessible_has_property(accessible:PGtkAccessible; _property:TGtkAccessibleProperty):Tgboolean;cdecl;external;
function gtk_test_accessible_has_relation(accessible:PGtkAccessible; relation:TGtkAccessibleRelation):Tgboolean;cdecl;external;
function gtk_test_accessible_has_state(accessible:PGtkAccessible; state:TGtkAccessibleState):Tgboolean;cdecl;external;
function gtk_test_accessible_check_property(accessible:PGtkAccessible; _property:TGtkAccessibleProperty; args:array of const):Pchar;cdecl;external;
function gtk_test_accessible_check_property(accessible:PGtkAccessible; _property:TGtkAccessibleProperty):Pchar;cdecl;external;
function gtk_test_accessible_check_relation(accessible:PGtkAccessible; relation:TGtkAccessibleRelation; args:array of const):Pchar;cdecl;external;
function gtk_test_accessible_check_relation(accessible:PGtkAccessible; relation:TGtkAccessibleRelation):Pchar;cdecl;external;
function gtk_test_accessible_check_state(accessible:PGtkAccessible; state:TGtkAccessibleState; args:array of const):Pchar;cdecl;external;
function gtk_test_accessible_check_state(accessible:PGtkAccessible; state:TGtkAccessibleState):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_test_accessible_assertion_message_role(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar; 
            accessible:PGtkAccessible; expected_role:TGtkAccessibleRole; actual_role:TGtkAccessibleRole);cdecl;external;

implementation


end.
