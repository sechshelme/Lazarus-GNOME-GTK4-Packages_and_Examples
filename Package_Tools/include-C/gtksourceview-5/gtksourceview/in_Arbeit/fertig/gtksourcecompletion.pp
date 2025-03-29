
unit gtksourcecompletion;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcecompletion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcecompletion.h
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
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceCompletion  = ^GtkSourceCompletion;
PGtkSourceCompletionProvider  = ^GtkSourceCompletionProvider;
PGtkSourceView  = ^GtkSourceView;
Pguint  = ^guint;
PPangoAttrList  = ^PangoAttrList;
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
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceCompletion, gtk_source_completion, GTK_SOURCE, COMPLETION, GObject) }
function gtk_source_completion_get_view(self:PGtkSourceCompletion):PGtkSourceView;cdecl;external;
function gtk_source_completion_get_buffer(self:PGtkSourceCompletion):PGtkSourceBuffer;cdecl;external;
procedure gtk_source_completion_show(self:PGtkSourceCompletion);cdecl;external;
procedure gtk_source_completion_hide(self:PGtkSourceCompletion);cdecl;external;
procedure gtk_source_completion_add_provider(self:PGtkSourceCompletion; provider:PGtkSourceCompletionProvider);cdecl;external;
procedure gtk_source_completion_remove_provider(self:PGtkSourceCompletion; provider:PGtkSourceCompletionProvider);cdecl;external;
procedure gtk_source_completion_block_interactive(self:PGtkSourceCompletion);cdecl;external;
procedure gtk_source_completion_unblock_interactive(self:PGtkSourceCompletion);cdecl;external;
function gtk_source_completion_get_page_size(self:PGtkSourceCompletion):Tguint;cdecl;external;
procedure gtk_source_completion_set_page_size(self:PGtkSourceCompletion; page_size:Tguint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_completion_fuzzy_match(haystack:Pchar; casefold_needle:Pchar; priority:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_completion_fuzzy_highlight(haystack:Pchar; casefold_query:Pchar):PPangoAttrList;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_COMPLETION:=gtk_source_completion_get_type;
  end;


end.
