
unit gtktextiter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktextiter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktextiter.h
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
PGdkPaintable  = ^GdkPaintable;
PGSList  = ^GSList;
PGtkTextBuffer  = ^GtkTextBuffer;
PGtkTextChildAnchor  = ^GtkTextChildAnchor;
PGtkTextIter  = ^GtkTextIter;
PGtkTextSearchFlags  = ^GtkTextSearchFlags;
PGtkTextTag  = ^GtkTextTag;
PPangoLanguage  = ^PangoLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtktextiter.h Copyright (C) 2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktextchild.h>}
{$include <gtk/gtktexttag.h>}
{*
 * GtkTextSearchFlags:
 * @GTK_TEXT_SEARCH_VISIBLE_ONLY: Search only visible data. A search match may
 * have invisible text interspersed.
 * @GTK_TEXT_SEARCH_TEXT_ONLY: Search only text. A match may have paintables or
 * child widgets mixed inside the matched range.
 * @GTK_TEXT_SEARCH_CASE_INSENSITIVE: The text will be matched regardless of
 * what case it is in.
 *
 * Flags affecting how a search is done.
 *
 * If neither `GTK_TEXT_SEARCH_VISIBLE_ONLY` nor `GTK_TEXT_SEARCH_TEXT_ONLY`
 * are enabled, the match must be exact; the special 0xFFFC character will
 * match embedded paintables or child widgets.
  }
{ Possible future plans: SEARCH_REGEXP  }
type
  PGtkTextSearchFlags = ^TGtkTextSearchFlags;
  TGtkTextSearchFlags =  Longint;
  Const
    GTK_TEXT_SEARCH_VISIBLE_ONLY = 1 shl 0;
    GTK_TEXT_SEARCH_TEXT_ONLY = 1 shl 1;
    GTK_TEXT_SEARCH_CASE_INSENSITIVE = 1 shl 2;
;
{
 * Iter: represents a location in the text. Becomes invalid if the
 * characters/pixmaps/widgets (indexable objects) in the text buffer
 * are changed.
  }
type

{ was #define dname def_expr }
function GTK_TYPE_TEXT_ITER : longint; { return type might be wrong }

{ GtkTextIter is an opaque datatype; ignore all these fields.
   * Initialize the iter with gtk_text_buffer_get_iter_*
   * functions
    }
{< private > }
{ padding  }
type
  PGtkTextIter = ^TGtkTextIter;
  TGtkTextIter = record
      dummy1 : Tgpointer;
      dummy2 : Tgpointer;
      dummy3 : longint;
      dummy4 : longint;
      dummy5 : longint;
      dummy6 : longint;
      dummy7 : longint;
      dummy8 : longint;
      dummy9 : Tgpointer;
      dummy10 : Tgpointer;
      dummy11 : longint;
      dummy12 : longint;
      dummy13 : longint;
      dummy14 : Tgpointer;
    end;

{ This is primarily intended for language bindings that want to avoid
   a "buffer" argument to text insertions, deletions, etc.  }
(* Const before type ignored *)

function gtk_text_iter_get_buffer(iter:PGtkTextIter):PGtkTextBuffer;cdecl;external;
{
 * Life cycle
  }
(* Const before type ignored *)
function gtk_text_iter_copy(iter:PGtkTextIter):PGtkTextIter;cdecl;external;
procedure gtk_text_iter_free(iter:PGtkTextIter);cdecl;external;
(* Const before type ignored *)
procedure gtk_text_iter_assign(iter:PGtkTextIter; other:PGtkTextIter);cdecl;external;
function gtk_text_iter_get_type:TGType;cdecl;external;
{
 * Convert to different kinds of index
  }
(* Const before type ignored *)
function gtk_text_iter_get_offset(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_line(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_line_offset(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_line_index(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_visible_line_offset(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_visible_line_index(iter:PGtkTextIter):longint;cdecl;external;
{
 * “Dereference” operators
  }
(* Const before type ignored *)
function gtk_text_iter_get_char(iter:PGtkTextIter):Tgunichar;cdecl;external;
{ includes the 0xFFFC char for pixmaps/widgets, so char offsets
 * into the returned string map properly into buffer char offsets
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_get_slice(start:PGtkTextIter; end:PGtkTextIter):Pchar;cdecl;external;
{ includes only text, no 0xFFFC  }
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_get_text(start:PGtkTextIter; end:PGtkTextIter):Pchar;cdecl;external;
{ exclude invisible chars  }
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_get_visible_slice(start:PGtkTextIter; end:PGtkTextIter):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_get_visible_text(start:PGtkTextIter; end:PGtkTextIter):Pchar;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_paintable(iter:PGtkTextIter):PGdkPaintable;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_marks(iter:PGtkTextIter):PGSList;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_child_anchor(iter:PGtkTextIter):PGtkTextChildAnchor;cdecl;external;
{ Return list of tags toggled at this point (toggled_on determines
 * whether the list is of on-toggles or off-toggles)
  }
(* Const before type ignored *)
function gtk_text_iter_get_toggled_tags(iter:PGtkTextIter; toggled_on:Tgboolean):PGSList;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_starts_tag(iter:PGtkTextIter; tag:PGtkTextTag):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_ends_tag(iter:PGtkTextIter; tag:PGtkTextTag):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_toggles_tag(iter:PGtkTextIter; tag:PGtkTextTag):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_has_tag(iter:PGtkTextIter; tag:PGtkTextTag):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_tags(iter:PGtkTextIter):PGSList;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_editable(iter:PGtkTextIter; default_setting:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_can_insert(iter:PGtkTextIter; default_editability:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_starts_word(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_ends_word(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_inside_word(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_starts_sentence(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_ends_sentence(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_inside_sentence(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_starts_line(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_ends_line(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_is_cursor_position(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_chars_in_line(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_bytes_in_line(iter:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_get_language(iter:PGtkTextIter):PPangoLanguage;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_is_end(iter:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_is_start(iter:PGtkTextIter):Tgboolean;cdecl;external;
{
 * Moving around the buffer
  }
function gtk_text_iter_forward_char(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_char(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_chars(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_chars(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_forward_line(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_line(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_lines(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_lines(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_forward_word_end(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_word_start(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_word_ends(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_word_starts(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_forward_visible_line(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_visible_line(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_visible_lines(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_visible_lines(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_forward_visible_word_end(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_visible_word_start(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_visible_word_ends(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_visible_word_starts(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_forward_sentence_end(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_sentence_start(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_sentence_ends(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_sentence_starts(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
{ cursor positions are almost equivalent to chars, but not quite;
 * in some languages, you can’t put the cursor between certain
 * chars. Also, you can’t put the cursor between \r\n at the end
 * of a line.
  }
function gtk_text_iter_forward_cursor_position(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_cursor_position(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_cursor_positions(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_cursor_positions(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_forward_visible_cursor_position(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_backward_visible_cursor_position(iter:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_text_iter_forward_visible_cursor_positions(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
function gtk_text_iter_backward_visible_cursor_positions(iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external;
procedure gtk_text_iter_set_offset(iter:PGtkTextIter; char_offset:longint);cdecl;external;
procedure gtk_text_iter_set_line(iter:PGtkTextIter; line_number:longint);cdecl;external;
procedure gtk_text_iter_set_line_offset(iter:PGtkTextIter; char_on_line:longint);cdecl;external;
procedure gtk_text_iter_set_line_index(iter:PGtkTextIter; byte_on_line:longint);cdecl;external;
procedure gtk_text_iter_forward_to_end(iter:PGtkTextIter);cdecl;external;
function gtk_text_iter_forward_to_line_end(iter:PGtkTextIter):Tgboolean;cdecl;external;
procedure gtk_text_iter_set_visible_line_offset(iter:PGtkTextIter; char_on_line:longint);cdecl;external;
procedure gtk_text_iter_set_visible_line_index(iter:PGtkTextIter; byte_on_line:longint);cdecl;external;
{ returns TRUE if a toggle was found; NULL for the tag pointer
 * means “any tag toggle”, otherwise the next toggle of the
 * specified tag is located.
  }
function gtk_text_iter_forward_to_tag_toggle(iter:PGtkTextIter; tag:PGtkTextTag):Tgboolean;cdecl;external;
function gtk_text_iter_backward_to_tag_toggle(iter:PGtkTextIter; tag:PGtkTextTag):Tgboolean;cdecl;external;
{*
 * GtkTextCharPredicate:
 * @ch: a Unicode code point
 * @user_data: data passed to the callback
 *
 * The predicate function used by gtk_text_iter_forward_find_char() and
 * gtk_text_iter_backward_find_char().
 *
 * Returns: %TRUE if the predicate is satisfied, and the iteration should
 *   stop, and %FALSE otherwise
  }
type

  TGtkTextCharPredicate = function (ch:Tgunichar; user_data:Tgpointer):Tgboolean;cdecl;
(* Const before type ignored *)

function gtk_text_iter_forward_find_char(iter:PGtkTextIter; pred:TGtkTextCharPredicate; user_data:Tgpointer; limit:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_text_iter_backward_find_char(iter:PGtkTextIter; pred:TGtkTextCharPredicate; user_data:Tgpointer; limit:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_forward_search(iter:PGtkTextIter; str:Pchar; flags:TGtkTextSearchFlags; match_start:PGtkTextIter; match_end:PGtkTextIter; 
           limit:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_backward_search(iter:PGtkTextIter; str:Pchar; flags:TGtkTextSearchFlags; match_start:PGtkTextIter; match_end:PGtkTextIter; 
           limit:PGtkTextIter):Tgboolean;cdecl;external;
{
 * Comparisons
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_equal(lhs:PGtkTextIter; rhs:PGtkTextIter):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_compare(lhs:PGtkTextIter; rhs:PGtkTextIter):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_text_iter_in_range(iter:PGtkTextIter; start:PGtkTextIter; end:PGtkTextIter):Tgboolean;cdecl;external;
{ Put these two in ascending order  }
procedure gtk_text_iter_order(first:PGtkTextIter; second:PGtkTextIter);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextIter, gtk_text_iter_free) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_TEXT_ITER : longint; { return type might be wrong }
  begin
    GTK_TYPE_TEXT_ITER:=gtk_text_iter_get_type;
  end;


end.
