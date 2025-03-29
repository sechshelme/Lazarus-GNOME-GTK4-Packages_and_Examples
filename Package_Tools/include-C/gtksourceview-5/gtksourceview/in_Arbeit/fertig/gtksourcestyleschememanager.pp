
unit gtksourcestyleschememanager;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcestyleschememanager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcestyleschememanager.h
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
Pgchar  = ^gchar;
PGtkSourceStyleScheme  = ^GtkSourceStyleScheme;
PGtkSourceStyleSchemeManager  = ^GtkSourceStyleSchemeManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2003-2007 - Paolo Maggi <paolo.maggi@polito.it>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceStyleSchemeManager, gtk_source_style_scheme_manager, GTK_SOURCE, STYLE_SCHEME_MANAGER, GObject) }
function gtk_source_style_scheme_manager_new:PGtkSourceStyleSchemeManager;cdecl;external;
function gtk_source_style_scheme_manager_get_default:PGtkSourceStyleSchemeManager;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_source_style_scheme_manager_set_search_path(manager:PGtkSourceStyleSchemeManager; path:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_style_scheme_manager_append_search_path(manager:PGtkSourceStyleSchemeManager; path:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_style_scheme_manager_prepend_search_path(manager:PGtkSourceStyleSchemeManager; path:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_source_style_scheme_manager_get_search_path(manager:PGtkSourceStyleSchemeManager):^Pgchar;cdecl;external;
procedure gtk_source_style_scheme_manager_force_rescan(manager:PGtkSourceStyleSchemeManager);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_source_style_scheme_manager_get_scheme_ids(manager:PGtkSourceStyleSchemeManager):^Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_style_scheme_manager_get_scheme(manager:PGtkSourceStyleSchemeManager; scheme_id:Pgchar):PGtkSourceStyleScheme;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER:=gtk_source_style_scheme_manager_get_type;
  end;


end.
