
unit gtksourcesnippetchunk;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcesnippetchunk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcesnippetchunk.h
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
function GTK_SOURCE_TYPE_SNIPPET_CHUNK : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceSnippetChunk, gtk_source_snippet_chunk, GTK_SOURCE, SNIPPET_CHUNK, GInitiallyUnowned) }
function gtk_source_snippet_chunk_new:PGtkSourceSnippetChunk;cdecl;external;
function gtk_source_snippet_chunk_copy(chunk:PGtkSourceSnippetChunk):PGtkSourceSnippetChunk;cdecl;external;
function gtk_source_snippet_chunk_get_context(chunk:PGtkSourceSnippetChunk):PGtkSourceSnippetContext;cdecl;external;
procedure gtk_source_snippet_chunk_set_context(chunk:PGtkSourceSnippetChunk; context:PGtkSourceSnippetContext);cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_chunk_get_spec(chunk:PGtkSourceSnippetChunk):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_chunk_set_spec(chunk:PGtkSourceSnippetChunk; spec:Pgchar);cdecl;external;
function gtk_source_snippet_chunk_get_focus_position(chunk:PGtkSourceSnippetChunk):Tgint;cdecl;external;
procedure gtk_source_snippet_chunk_set_focus_position(chunk:PGtkSourceSnippetChunk; focus_position:Tgint);cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_chunk_get_text(chunk:PGtkSourceSnippetChunk):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_chunk_set_text(chunk:PGtkSourceSnippetChunk; text:Pgchar);cdecl;external;
function gtk_source_snippet_chunk_get_text_set(chunk:PGtkSourceSnippetChunk):Tgboolean;cdecl;external;
procedure gtk_source_snippet_chunk_set_text_set(chunk:PGtkSourceSnippetChunk; text_set:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gtk_source_snippet_chunk_get_tooltip_text(chunk:PGtkSourceSnippetChunk):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_snippet_chunk_set_tooltip_text(chunk:PGtkSourceSnippetChunk; tooltip_text:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SNIPPET_CHUNK : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SNIPPET_CHUNK:=gtk_source_snippet_chunk_get_type;
  end;


end.
