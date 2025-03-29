
unit gtksourcesearchcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcesearchcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcesearchcontext.h
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
PGAsyncResult  = ^GAsyncResult;
Pgboolean  = ^gboolean;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceSearchContext  = ^GtkSourceSearchContext;
PGtkSourceSearchSettings  = ^GtkSourceSearchSettings;
PGtkSourceStyle  = ^GtkSourceStyle;
PGtkTextIter  = ^GtkTextIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2013, 2016 - Sébastien Wilmet <swilmet@gnome.org>
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
function GTK_SOURCE_TYPE_SEARCH_CONTEXT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceSearchContext, gtk_source_search_context, GTK_SOURCE, SEARCH_CONTEXT, GObject) }
function gtk_source_search_context_new(buffer:PGtkSourceBuffer; settings:PGtkSourceSearchSettings):PGtkSourceSearchContext;cdecl;external;
function gtk_source_search_context_get_buffer(search:PGtkSourceSearchContext):PGtkSourceBuffer;cdecl;external;
function gtk_source_search_context_get_settings(search:PGtkSourceSearchContext):PGtkSourceSearchSettings;cdecl;external;
function gtk_source_search_context_get_highlight(search:PGtkSourceSearchContext):Tgboolean;cdecl;external;
procedure gtk_source_search_context_set_highlight(search:PGtkSourceSearchContext; highlight:Tgboolean);cdecl;external;
function gtk_source_search_context_get_match_style(search:PGtkSourceSearchContext):PGtkSourceStyle;cdecl;external;
procedure gtk_source_search_context_set_match_style(search:PGtkSourceSearchContext; match_style:PGtkSourceStyle);cdecl;external;
function gtk_source_search_context_get_regex_error(search:PGtkSourceSearchContext):PGError;cdecl;external;
function gtk_source_search_context_get_occurrences_count(search:PGtkSourceSearchContext):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_search_context_get_occurrence_position(search:PGtkSourceSearchContext; match_start:PGtkTextIter; match_end:PGtkTextIter):Tgint;cdecl;external;
(* Const before type ignored *)
function gtk_source_search_context_forward(search:PGtkSourceSearchContext; iter:PGtkTextIter; match_start:PGtkTextIter; match_end:PGtkTextIter; has_wrapped_around:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_search_context_forward_async(search:PGtkSourceSearchContext; iter:PGtkTextIter; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_source_search_context_forward_finish(search:PGtkSourceSearchContext; result:PGAsyncResult; match_start:PGtkTextIter; match_end:PGtkTextIter; has_wrapped_around:Pgboolean; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_search_context_backward(search:PGtkSourceSearchContext; iter:PGtkTextIter; match_start:PGtkTextIter; match_end:PGtkTextIter; has_wrapped_around:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_search_context_backward_async(search:PGtkSourceSearchContext; iter:PGtkTextIter; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_source_search_context_backward_finish(search:PGtkSourceSearchContext; result:PGAsyncResult; match_start:PGtkTextIter; match_end:PGtkTextIter; has_wrapped_around:Pgboolean; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_search_context_replace(search:PGtkSourceSearchContext; match_start:PGtkTextIter; match_end:PGtkTextIter; replace:Pgchar; replace_length:Tgint; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_search_context_replace_all(search:PGtkSourceSearchContext; replace:Pgchar; replace_length:Tgint; error:PPGError):Tguint;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SEARCH_CONTEXT : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SEARCH_CONTEXT:=gtk_source_search_context_get_type;
  end;


end.
