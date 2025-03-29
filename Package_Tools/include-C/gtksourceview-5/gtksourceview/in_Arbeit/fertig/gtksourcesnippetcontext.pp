
unit gtksourcesnippetcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcesnippetcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcesnippetcontext.h
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
PGtkSourceSnippetContext  = ^GtkSourceSnippetContext;
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
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SNIPPET_CONTEXT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceSnippetContext, gtk_source_snippet_context, GTK_SOURCE, SNIPPET_CONTEXT, GObject) }
function gtk_source_snippet_context_new:PGtkSourceSnippetContext;cdecl;external;
procedure gtk_source_snippet_context_clear_variables(self:PGtkSourceSnippetContext);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_snippet_context_set_variable(self:PGtkSourceSnippetContext; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_snippet_context_set_constant(self:PGtkSourceSnippetContext; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_snippet_context_get_variable(self:PGtkSourceSnippetContext; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_context_expand(self:PGtkSourceSnippetContext; input:Pgchar):Pgchar;cdecl;external;
procedure gtk_source_snippet_context_set_tab_width(self:PGtkSourceSnippetContext; tab_width:Tgint);cdecl;external;
procedure gtk_source_snippet_context_set_use_spaces(self:PGtkSourceSnippetContext; use_spaces:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_context_set_line_prefix(self:PGtkSourceSnippetContext; line_prefix:Pgchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SNIPPET_CONTEXT : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SNIPPET_CONTEXT:=gtk_source_snippet_context_get_type;
  end;


end.
