
unit gtksourcesnippet;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcesnippet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcesnippet.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGtkSourceSnippet  = ^GtkSourceSnippet;
PGtkSourceSnippetChunk  = ^GtkSourceSnippetChunk;
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
function GTK_SOURCE_TYPE_SNIPPET : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceSnippet, gtk_source_snippet, GTK_SOURCE, SNIPPET, GObject) }
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_snippet_new(trigger:Pgchar; language_id:Pgchar):PGtkSourceSnippet;cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_new_parsed(text:Pchar; error:PPGError):PGtkSourceSnippet;cdecl;external;
function gtk_source_snippet_copy(snippet:PGtkSourceSnippet):PGtkSourceSnippet;cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_get_name(snippet:PGtkSourceSnippet):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_set_name(snippet:PGtkSourceSnippet; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_get_trigger(snippet:PGtkSourceSnippet):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_set_trigger(snippet:PGtkSourceSnippet; trigger:Pgchar);cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_get_language_id(snippet:PGtkSourceSnippet):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_set_language_id(snippet:PGtkSourceSnippet; language_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_get_description(snippet:PGtkSourceSnippet):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_set_description(snippet:PGtkSourceSnippet; description:Pgchar);cdecl;external;
procedure gtk_source_snippet_add_chunk(snippet:PGtkSourceSnippet; chunk:PGtkSourceSnippetChunk);cdecl;external;
function gtk_source_snippet_get_n_chunks(snippet:PGtkSourceSnippet):Tguint;cdecl;external;
function gtk_source_snippet_get_focus_position(snippet:PGtkSourceSnippet):Tgint;cdecl;external;
function gtk_source_snippet_get_nth_chunk(snippet:PGtkSourceSnippet; nth:Tguint):PGtkSourceSnippetChunk;cdecl;external;
function gtk_source_snippet_get_context(snippet:PGtkSourceSnippet):PGtkSourceSnippetContext;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SNIPPET : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SNIPPET:=gtk_source_snippet_get_type;
  end;


end.
