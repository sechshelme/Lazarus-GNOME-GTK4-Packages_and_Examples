
unit gtksourcebuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcebuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcebuffer.h
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
PGSList  = ^GSList;
PGtkSourceBracketMatchType  = ^GtkSourceBracketMatchType;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceBufferClass  = ^GtkSourceBufferClass;
PGtkSourceChangeCaseType  = ^GtkSourceChangeCaseType;
PGtkSourceLanguage  = ^GtkSourceLanguage;
PGtkSourceMark  = ^GtkSourceMark;
PGtkSourceSortFlags  = ^GtkSourceSortFlags;
PGtkSourceStyleScheme  = ^GtkSourceStyleScheme;
PGtkTextIter  = ^GtkTextIter;
PGtkTextTag  = ^GtkTextTag;
PGtkTextTagTable  = ^GtkTextTagTable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 1999-2002 - Mikael Hermansson <tyan@linux.se>,
 *                       Chris Phelps <chicane@reninet.com> and
 *                       Jeroen Zwartepoorte <jeroen@xs4all.nl>
 * Copyright 2003 - Paolo Maggi, Gustavo Giráldez
 * Copyright 2014 - Sébastien Wilmet <swilmet@gnome.org>
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
function GTK_SOURCE_TYPE_BUFFER : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceBuffer, gtk_source_buffer, GTK_SOURCE, BUFFER, GtkTextBuffer) }
{*
 * GtkSourceBracketMatchType:
 * @GTK_SOURCE_BRACKET_MATCH_NONE: there is no bracket to match.
 * @GTK_SOURCE_BRACKET_MATCH_OUT_OF_RANGE: matching a bracket
 *  failed because the maximum range was reached.
 * @GTK_SOURCE_BRACKET_MATCH_NOT_FOUND: a matching bracket was not found.
 * @GTK_SOURCE_BRACKET_MATCH_FOUND: a matching bracket was found.
  }
type
  PGtkSourceBracketMatchType = ^TGtkSourceBracketMatchType;
  TGtkSourceBracketMatchType =  Longint;
  Const
    GTK_SOURCE_BRACKET_MATCH_NONE = 0;
    GTK_SOURCE_BRACKET_MATCH_OUT_OF_RANGE = 1;
    GTK_SOURCE_BRACKET_MATCH_NOT_FOUND = 2;
    GTK_SOURCE_BRACKET_MATCH_FOUND = 3;
;
{*
 * GtkSourceChangeCaseType:
 * @GTK_SOURCE_CHANGE_CASE_LOWER: change case to lowercase.
 * @GTK_SOURCE_CHANGE_CASE_UPPER: change case to uppercase.
 * @GTK_SOURCE_CHANGE_CASE_TOGGLE: toggle case of each character.
 * @GTK_SOURCE_CHANGE_CASE_TITLE: capitalize each word.
  }
type
  PGtkSourceChangeCaseType = ^TGtkSourceChangeCaseType;
  TGtkSourceChangeCaseType =  Longint;
  Const
    GTK_SOURCE_CHANGE_CASE_LOWER = 0;
    GTK_SOURCE_CHANGE_CASE_UPPER = 1;
    GTK_SOURCE_CHANGE_CASE_TOGGLE = 2;
    GTK_SOURCE_CHANGE_CASE_TITLE = 3;
;
{*
 * GtkSourceSortFlags:
 * @GTK_SOURCE_SORT_FLAGS_NONE: no flags specified
 * @GTK_SOURCE_SORT_FLAGS_CASE_SENSITIVE: case sensitive sort
 * @GTK_SOURCE_SORT_FLAGS_REVERSE_ORDER: sort in reverse order
 * @GTK_SOURCE_SORT_FLAGS_REMOVE_DUPLICATES: remove duplicates
  }
type
  PGtkSourceSortFlags = ^TGtkSourceSortFlags;
  TGtkSourceSortFlags =  Longint;
  Const
    GTK_SOURCE_SORT_FLAGS_NONE = 0;
    GTK_SOURCE_SORT_FLAGS_CASE_SENSITIVE = 1 shl 0;
    GTK_SOURCE_SORT_FLAGS_REVERSE_ORDER = 1 shl 1;
    GTK_SOURCE_SORT_FLAGS_REMOVE_DUPLICATES = 1 shl 2;
;
{ Signals  }
{< private > }
type
  PGtkSourceBufferClass = ^TGtkSourceBufferClass;
  TGtkSourceBufferClass = record
      parent_class : TGtkTextBufferClass;
      bracket_matched : procedure (buffer:PGtkSourceBuffer; iter:PGtkTextIter; state:TGtkSourceBracketMatchType);cdecl;
      _reserved : array[0..19] of Tgpointer;
    end;


function gtk_source_buffer_new(table:PGtkTextTagTable):PGtkSourceBuffer;cdecl;external;
function gtk_source_buffer_new_with_language(language:PGtkSourceLanguage):PGtkSourceBuffer;cdecl;external;
function gtk_source_buffer_get_highlight_syntax(buffer:PGtkSourceBuffer):Tgboolean;cdecl;external;
procedure gtk_source_buffer_set_highlight_syntax(buffer:PGtkSourceBuffer; highlight:Tgboolean);cdecl;external;
function gtk_source_buffer_get_highlight_matching_brackets(buffer:PGtkSourceBuffer):Tgboolean;cdecl;external;
procedure gtk_source_buffer_set_highlight_matching_brackets(buffer:PGtkSourceBuffer; highlight:Tgboolean);cdecl;external;
function gtk_source_buffer_get_language(buffer:PGtkSourceBuffer):PGtkSourceLanguage;cdecl;external;
procedure gtk_source_buffer_set_language(buffer:PGtkSourceBuffer; language:PGtkSourceLanguage);cdecl;external;
function gtk_source_buffer_get_loading(buffer:PGtkSourceBuffer):Tgboolean;cdecl;external;
function gtk_source_buffer_get_style_scheme(buffer:PGtkSourceBuffer):PGtkSourceStyleScheme;cdecl;external;
procedure gtk_source_buffer_set_style_scheme(buffer:PGtkSourceBuffer; scheme:PGtkSourceStyleScheme);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_buffer_ensure_highlight(buffer:PGtkSourceBuffer; start:PGtkTextIter; end:PGtkTextIter);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_buffer_create_source_mark(buffer:PGtkSourceBuffer; name:Pgchar; category:Pgchar; where:PGtkTextIter):PGtkSourceMark;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_forward_iter_to_source_mark(buffer:PGtkSourceBuffer; iter:PGtkTextIter; category:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_backward_iter_to_source_mark(buffer:PGtkSourceBuffer; iter:PGtkTextIter; category:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_get_source_marks_at_iter(buffer:PGtkSourceBuffer; iter:PGtkTextIter; category:Pgchar):PGSList;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_get_source_marks_at_line(buffer:PGtkSourceBuffer; line:Tgint; category:Pgchar):PGSList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_buffer_remove_source_marks(buffer:PGtkSourceBuffer; start:PGtkTextIter; end:PGtkTextIter; category:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_buffer_iter_has_context_class(buffer:PGtkSourceBuffer; iter:PGtkTextIter; context_class:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_get_context_classes_at_iter(buffer:PGtkSourceBuffer; iter:PGtkTextIter):^Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_iter_forward_to_context_class_toggle(buffer:PGtkSourceBuffer; iter:PGtkTextIter; context_class:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_buffer_iter_backward_to_context_class_toggle(buffer:PGtkSourceBuffer; iter:PGtkTextIter; context_class:Pgchar):Tgboolean;cdecl;external;
procedure gtk_source_buffer_change_case(buffer:PGtkSourceBuffer; case_type:TGtkSourceChangeCaseType; start:PGtkTextIter; end:PGtkTextIter);cdecl;external;
procedure gtk_source_buffer_join_lines(buffer:PGtkSourceBuffer; start:PGtkTextIter; end:PGtkTextIter);cdecl;external;
procedure gtk_source_buffer_sort_lines(buffer:PGtkSourceBuffer; start:PGtkTextIter; end:PGtkTextIter; flags:TGtkSourceSortFlags; column:Tgint);cdecl;external;
procedure gtk_source_buffer_set_implicit_trailing_newline(buffer:PGtkSourceBuffer; implicit_trailing_newline:Tgboolean);cdecl;external;
function gtk_source_buffer_get_implicit_trailing_newline(buffer:PGtkSourceBuffer):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_buffer_create_source_tag(buffer:PGtkSourceBuffer; tag_name:Pgchar; first_property_name:Pgchar; args:array of const):PGtkTextTag;cdecl;external;
function gtk_source_buffer_create_source_tag(buffer:PGtkSourceBuffer; tag_name:Pgchar; first_property_name:Pgchar):PGtkTextTag;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_BUFFER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_BUFFER:=gtk_source_buffer_get_type;
  end;


end.
