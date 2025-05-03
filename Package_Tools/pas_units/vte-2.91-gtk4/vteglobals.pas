unit vteglobals;

interface

uses
  fp_glib2, fp_GTK4;

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

function vte_get_user_shell:Pchar;cdecl;external libvte_2_91_gtk4 ;
function vte_get_features:Pchar;cdecl;external libvte_2_91_gtk4 ;
function vte_get_feature_flags:TVteFeatureFlags;cdecl;external libvte_2_91_gtk4 ;
{ was #define dname def_expr }
function VTE_TEST_FLAGS_NONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function VTE_TEST_FLAGS_ALL : longint; { return type might be wrong }

procedure vte_set_test_flags(flags:Tguint64);cdecl;external libvte_2_91_gtk4 ;

// === Konventiert am: 3-5-25 17:04:13 ===


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
