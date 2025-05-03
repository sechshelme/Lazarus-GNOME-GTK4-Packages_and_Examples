
unit vteglobals;
interface

{
  Automatically converted by H2Pas 1.0.0 from vteglobals.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vteglobals.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001,2002,2003,2009,2010 Red Hat, Inc.
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}
{$include "vtemacros.h"}
{$include "vteenums.h"}

function vte_get_user_shell:Pchar;cdecl;external;
(* Const before type ignored *)
function vte_get_features:Pchar;cdecl;external;
function vte_get_feature_flags:TVteFeatureFlags;cdecl;external;
{ was #define dname def_expr }
function VTE_TEST_FLAGS_NONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function VTE_TEST_FLAGS_ALL : longint; { return type might be wrong }

procedure vte_set_test_flags(flags:Tguint64);cdecl;external;

implementation

{ was #define dname def_expr }
function VTE_TEST_FLAGS_NONE : longint; { return type might be wrong }
  begin
    VTE_TEST_FLAGS_NONE:=G_GUINT64_CONSTANT(0);
  end;

{ was #define dname def_expr }
function VTE_TEST_FLAGS_ALL : longint; { return type might be wrong }
  begin
    VTE_TEST_FLAGS_ALL:= not (G_GUINT64_CONSTANT(0));
  end;


end.
