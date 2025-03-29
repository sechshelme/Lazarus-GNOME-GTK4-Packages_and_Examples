
unit gtksourcesnippetmanager;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcesnippetmanager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcesnippetmanager.h
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
PGListModel  = ^GListModel;
PGtkSourceSnippet  = ^GtkSourceSnippet;
PGtkSourceSnippetManager  = ^GtkSourceSnippetManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2020 Christian Hergert <chergert@redhat.com>
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
{$include <gio/gio.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SNIPPET_MANAGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceSnippetManager, gtk_source_snippet_manager, GTK_SOURCE, SNIPPET_MANAGER, GObject) }
function gtk_source_snippet_manager_get_default:PGtkSourceSnippetManager;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_source_snippet_manager_get_search_path(self:PGtkSourceSnippetManager):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_source_snippet_manager_set_search_path(self:PGtkSourceSnippetManager; dirs:PPgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_snippet_manager_get_snippet(self:PGtkSourceSnippetManager; group:Pgchar; language_id:Pgchar; trigger:Pgchar):PGtkSourceSnippet;cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_manager_list_groups(self:PGtkSourceSnippetManager):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_snippet_manager_list_matching(self:PGtkSourceSnippetManager; group:Pgchar; language_id:Pgchar; trigger_prefix:Pgchar):PGListModel;cdecl;external;
function gtk_source_snippet_manager_list_all(self:PGtkSourceSnippetManager):PGListModel;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SNIPPET_MANAGER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SNIPPET_MANAGER:=gtk_source_snippet_manager_get_type;
  end;


end.
