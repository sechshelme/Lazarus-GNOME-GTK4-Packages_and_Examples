
unit pango_break;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_break.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_break.h
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
PPangoAnalysis  = ^PangoAnalysis;
PPangoAttrList  = ^PangoAttrList;
PPangoLanguage  = ^PangoLanguage;
PPangoLogAttr  = ^PangoLogAttr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-break.h:
 *
 * Copyright (C) 1999 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_BREAK_H__}
{$define __PANGO_BREAK_H__}
{$include <glib.h>}
{$include <pango/pango-item.h>}
{ Logical attributes of a character.
  }
{*
 * PangoLogAttr:
 * @is_line_break: if set, can break line in front of character
 * @is_mandatory_break: if set, must break line in front of character
 * @is_char_break: if set, can break here when doing character wrapping
 * @is_white: is whitespace character
 * @is_cursor_position: if set, cursor can appear in front of character.
 *   i.e. this is a grapheme boundary, or the first character in the text.
 *   This flag implements Unicode's
 *   [Grapheme Cluster Boundaries](http://www.unicode.org/reports/tr29/)
 *   semantics.
 * @is_word_start: is first character in a word
 * @is_word_end: is first non-word char after a word
 *   Note that in degenerate cases, you could have both @is_word_start
 *   and @is_word_end set for some character.
 * @is_sentence_boundary: is a sentence boundary.
 *   There are two ways to divide sentences. The first assigns all
 *   inter-sentence whitespace/control/format chars to some sentence,
 *   so all chars are in some sentence; @is_sentence_boundary denotes
 *   the boundaries there. The second way doesn't assign
 *   between-sentence spaces, etc. to any sentence, so
 *   @is_sentence_start/@is_sentence_end mark the boundaries of those sentences.
 * @is_sentence_start: is first character in a sentence
 * @is_sentence_end: is first char after a sentence.
 *   Note that in degenerate cases, you could have both @is_sentence_start
 *   and @is_sentence_end set for some character. (e.g. no space after a
 *   period, so the next sentence starts right away)
 * @backspace_deletes_character: if set, backspace deletes one character
 *   rather than the entire grapheme cluster. This field is only meaningful
 *   on grapheme boundaries (where @is_cursor_position is set). In some languages,
 *   the full grapheme (e.g. letter + diacritics) is considered a unit, while in
 *   others, each decomposed character in the grapheme is a unit. In the default
 *   implementation of [func@break], this bit is set on all grapheme boundaries
 *   except those following Latin, Cyrillic or Greek base characters.
 * @is_expandable_space: is a whitespace character that can possibly be
 *   expanded for justification purposes. (Since: 1.18)
 * @is_word_boundary: is a word boundary, as defined by UAX#29.
 *   More specifically, means that this is not a position in the middle of a word.
 *   For example, both sides of a punctuation mark are considered word boundaries.
 *   This flag is particularly useful when selecting text word-by-word. This flag
 *   implements Unicode's [Word Boundaries](http://www.unicode.org/reports/tr29/)
 *   semantics. (Since: 1.22)
 * @break_inserts_hyphen: when breaking lines before this char, insert a hyphen.
 *   Since: 1.50
 * @break_removes_preceding: when breaking lines before this char, remove the
 *   preceding char. Since 1.50
 *
 * The `PangoLogAttr` structure stores information about the attributes of a
 * single character.
  }
type
  PPangoLogAttr = ^TPangoLogAttr;
  TPangoLogAttr = record
      flag0 : longint;
    end;


const
  bm_TPangoLogAttr_is_line_break = $1;
  bp_TPangoLogAttr_is_line_break = 0;
  bm_TPangoLogAttr_is_mandatory_break = $2;
  bp_TPangoLogAttr_is_mandatory_break = 1;
  bm_TPangoLogAttr_is_char_break = $4;
  bp_TPangoLogAttr_is_char_break = 2;
  bm_TPangoLogAttr_is_white = $8;
  bp_TPangoLogAttr_is_white = 3;
  bm_TPangoLogAttr_is_cursor_position = $10;
  bp_TPangoLogAttr_is_cursor_position = 4;
  bm_TPangoLogAttr_is_word_start = $20;
  bp_TPangoLogAttr_is_word_start = 5;
  bm_TPangoLogAttr_is_word_end = $40;
  bp_TPangoLogAttr_is_word_end = 6;
  bm_TPangoLogAttr_is_sentence_boundary = $80;
  bp_TPangoLogAttr_is_sentence_boundary = 7;
  bm_TPangoLogAttr_is_sentence_start = $100;
  bp_TPangoLogAttr_is_sentence_start = 8;
  bm_TPangoLogAttr_is_sentence_end = $200;
  bp_TPangoLogAttr_is_sentence_end = 9;
  bm_TPangoLogAttr_backspace_deletes_character = $400;
  bp_TPangoLogAttr_backspace_deletes_character = 10;
  bm_TPangoLogAttr_is_expandable_space = $800;
  bp_TPangoLogAttr_is_expandable_space = 11;
  bm_TPangoLogAttr_is_word_boundary = $1000;
  bp_TPangoLogAttr_is_word_boundary = 12;
  bm_TPangoLogAttr_break_inserts_hyphen = $2000;
  bp_TPangoLogAttr_break_inserts_hyphen = 13;
  bm_TPangoLogAttr_break_removes_preceding = $4000;
  bp_TPangoLogAttr_break_removes_preceding = 14;
  bm_TPangoLogAttr_reserved = $FFFF8000;
  bp_TPangoLogAttr_reserved = 15;

function is_line_break(var a : TPangoLogAttr) : Tguint;
procedure set_is_line_break(var a : TPangoLogAttr; __is_line_break : Tguint);
function is_mandatory_break(var a : TPangoLogAttr) : Tguint;
procedure set_is_mandatory_break(var a : TPangoLogAttr; __is_mandatory_break : Tguint);
function is_char_break(var a : TPangoLogAttr) : Tguint;
procedure set_is_char_break(var a : TPangoLogAttr; __is_char_break : Tguint);
function is_white(var a : TPangoLogAttr) : Tguint;
procedure set_is_white(var a : TPangoLogAttr; __is_white : Tguint);
function is_cursor_position(var a : TPangoLogAttr) : Tguint;
procedure set_is_cursor_position(var a : TPangoLogAttr; __is_cursor_position : Tguint);
function is_word_start(var a : TPangoLogAttr) : Tguint;
procedure set_is_word_start(var a : TPangoLogAttr; __is_word_start : Tguint);
function is_word_end(var a : TPangoLogAttr) : Tguint;
procedure set_is_word_end(var a : TPangoLogAttr; __is_word_end : Tguint);
function is_sentence_boundary(var a : TPangoLogAttr) : Tguint;
procedure set_is_sentence_boundary(var a : TPangoLogAttr; __is_sentence_boundary : Tguint);
function is_sentence_start(var a : TPangoLogAttr) : Tguint;
procedure set_is_sentence_start(var a : TPangoLogAttr; __is_sentence_start : Tguint);
function is_sentence_end(var a : TPangoLogAttr) : Tguint;
procedure set_is_sentence_end(var a : TPangoLogAttr; __is_sentence_end : Tguint);
function backspace_deletes_character(var a : TPangoLogAttr) : Tguint;
procedure set_backspace_deletes_character(var a : TPangoLogAttr; __backspace_deletes_character : Tguint);
function is_expandable_space(var a : TPangoLogAttr) : Tguint;
procedure set_is_expandable_space(var a : TPangoLogAttr; __is_expandable_space : Tguint);
function is_word_boundary(var a : TPangoLogAttr) : Tguint;
procedure set_is_word_boundary(var a : TPangoLogAttr; __is_word_boundary : Tguint);
function break_inserts_hyphen(var a : TPangoLogAttr) : Tguint;
procedure set_break_inserts_hyphen(var a : TPangoLogAttr; __break_inserts_hyphen : Tguint);
function break_removes_preceding(var a : TPangoLogAttr) : Tguint;
procedure set_break_removes_preceding(var a : TPangoLogAttr; __break_removes_preceding : Tguint);
function reserved(var a : TPangoLogAttr) : Tguint;
procedure set_reserved(var a : TPangoLogAttr; __reserved : Tguint);
(* Const before type ignored *)

procedure pango_break(text:Pchar; length:longint; analysis:PPangoAnalysis; attrs:PPangoLogAttr; attrs_len:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_get_log_attrs(text:Pchar; length:longint; level:longint; language:PPangoLanguage; attrs:PPangoLogAttr; 
            attrs_len:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_default_break(text:Pchar; length:longint; analysis:PPangoAnalysis; attrs:PPangoLogAttr; attrs_len:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_tailor_break(text:Pchar; length:longint; analysis:PPangoAnalysis; offset:longint; attrs:PPangoLogAttr; 
            attrs_len:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_attr_break(text:Pchar; length:longint; attr_list:PPangoAttrList; offset:longint; attrs:PPangoLogAttr; 
            attrs_len:longint);cdecl;external;
{$endif}
{ __PANGO_BREAK_H__  }

implementation

function is_line_break(var a : TPangoLogAttr) : Tguint;
begin
  is_line_break:=(a.flag0 and bm_TPangoLogAttr_is_line_break) shr bp_TPangoLogAttr_is_line_break;
end;

procedure set_is_line_break(var a : TPangoLogAttr; __is_line_break : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_line_break shl bp_TPangoLogAttr_is_line_break) and bm_TPangoLogAttr_is_line_break);
end;

function is_mandatory_break(var a : TPangoLogAttr) : Tguint;
begin
  is_mandatory_break:=(a.flag0 and bm_TPangoLogAttr_is_mandatory_break) shr bp_TPangoLogAttr_is_mandatory_break;
end;

procedure set_is_mandatory_break(var a : TPangoLogAttr; __is_mandatory_break : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_mandatory_break shl bp_TPangoLogAttr_is_mandatory_break) and bm_TPangoLogAttr_is_mandatory_break);
end;

function is_char_break(var a : TPangoLogAttr) : Tguint;
begin
  is_char_break:=(a.flag0 and bm_TPangoLogAttr_is_char_break) shr bp_TPangoLogAttr_is_char_break;
end;

procedure set_is_char_break(var a : TPangoLogAttr; __is_char_break : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_char_break shl bp_TPangoLogAttr_is_char_break) and bm_TPangoLogAttr_is_char_break);
end;

function is_white(var a : TPangoLogAttr) : Tguint;
begin
  is_white:=(a.flag0 and bm_TPangoLogAttr_is_white) shr bp_TPangoLogAttr_is_white;
end;

procedure set_is_white(var a : TPangoLogAttr; __is_white : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_white shl bp_TPangoLogAttr_is_white) and bm_TPangoLogAttr_is_white);
end;

function is_cursor_position(var a : TPangoLogAttr) : Tguint;
begin
  is_cursor_position:=(a.flag0 and bm_TPangoLogAttr_is_cursor_position) shr bp_TPangoLogAttr_is_cursor_position;
end;

procedure set_is_cursor_position(var a : TPangoLogAttr; __is_cursor_position : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_cursor_position shl bp_TPangoLogAttr_is_cursor_position) and bm_TPangoLogAttr_is_cursor_position);
end;

function is_word_start(var a : TPangoLogAttr) : Tguint;
begin
  is_word_start:=(a.flag0 and bm_TPangoLogAttr_is_word_start) shr bp_TPangoLogAttr_is_word_start;
end;

procedure set_is_word_start(var a : TPangoLogAttr; __is_word_start : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_word_start shl bp_TPangoLogAttr_is_word_start) and bm_TPangoLogAttr_is_word_start);
end;

function is_word_end(var a : TPangoLogAttr) : Tguint;
begin
  is_word_end:=(a.flag0 and bm_TPangoLogAttr_is_word_end) shr bp_TPangoLogAttr_is_word_end;
end;

procedure set_is_word_end(var a : TPangoLogAttr; __is_word_end : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_word_end shl bp_TPangoLogAttr_is_word_end) and bm_TPangoLogAttr_is_word_end);
end;

function is_sentence_boundary(var a : TPangoLogAttr) : Tguint;
begin
  is_sentence_boundary:=(a.flag0 and bm_TPangoLogAttr_is_sentence_boundary) shr bp_TPangoLogAttr_is_sentence_boundary;
end;

procedure set_is_sentence_boundary(var a : TPangoLogAttr; __is_sentence_boundary : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_sentence_boundary shl bp_TPangoLogAttr_is_sentence_boundary) and bm_TPangoLogAttr_is_sentence_boundary);
end;

function is_sentence_start(var a : TPangoLogAttr) : Tguint;
begin
  is_sentence_start:=(a.flag0 and bm_TPangoLogAttr_is_sentence_start) shr bp_TPangoLogAttr_is_sentence_start;
end;

procedure set_is_sentence_start(var a : TPangoLogAttr; __is_sentence_start : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_sentence_start shl bp_TPangoLogAttr_is_sentence_start) and bm_TPangoLogAttr_is_sentence_start);
end;

function is_sentence_end(var a : TPangoLogAttr) : Tguint;
begin
  is_sentence_end:=(a.flag0 and bm_TPangoLogAttr_is_sentence_end) shr bp_TPangoLogAttr_is_sentence_end;
end;

procedure set_is_sentence_end(var a : TPangoLogAttr; __is_sentence_end : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_sentence_end shl bp_TPangoLogAttr_is_sentence_end) and bm_TPangoLogAttr_is_sentence_end);
end;

function backspace_deletes_character(var a : TPangoLogAttr) : Tguint;
begin
  backspace_deletes_character:=(a.flag0 and bm_TPangoLogAttr_backspace_deletes_character) shr bp_TPangoLogAttr_backspace_deletes_character;
end;

procedure set_backspace_deletes_character(var a : TPangoLogAttr; __backspace_deletes_character : Tguint);
begin
  a.flag0:=a.flag0 or ((__backspace_deletes_character shl bp_TPangoLogAttr_backspace_deletes_character) and bm_TPangoLogAttr_backspace_deletes_character);
end;

function is_expandable_space(var a : TPangoLogAttr) : Tguint;
begin
  is_expandable_space:=(a.flag0 and bm_TPangoLogAttr_is_expandable_space) shr bp_TPangoLogAttr_is_expandable_space;
end;

procedure set_is_expandable_space(var a : TPangoLogAttr; __is_expandable_space : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_expandable_space shl bp_TPangoLogAttr_is_expandable_space) and bm_TPangoLogAttr_is_expandable_space);
end;

function is_word_boundary(var a : TPangoLogAttr) : Tguint;
begin
  is_word_boundary:=(a.flag0 and bm_TPangoLogAttr_is_word_boundary) shr bp_TPangoLogAttr_is_word_boundary;
end;

procedure set_is_word_boundary(var a : TPangoLogAttr; __is_word_boundary : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_word_boundary shl bp_TPangoLogAttr_is_word_boundary) and bm_TPangoLogAttr_is_word_boundary);
end;

function break_inserts_hyphen(var a : TPangoLogAttr) : Tguint;
begin
  break_inserts_hyphen:=(a.flag0 and bm_TPangoLogAttr_break_inserts_hyphen) shr bp_TPangoLogAttr_break_inserts_hyphen;
end;

procedure set_break_inserts_hyphen(var a : TPangoLogAttr; __break_inserts_hyphen : Tguint);
begin
  a.flag0:=a.flag0 or ((__break_inserts_hyphen shl bp_TPangoLogAttr_break_inserts_hyphen) and bm_TPangoLogAttr_break_inserts_hyphen);
end;

function break_removes_preceding(var a : TPangoLogAttr) : Tguint;
begin
  break_removes_preceding:=(a.flag0 and bm_TPangoLogAttr_break_removes_preceding) shr bp_TPangoLogAttr_break_removes_preceding;
end;

procedure set_break_removes_preceding(var a : TPangoLogAttr; __break_removes_preceding : Tguint);
begin
  a.flag0:=a.flag0 or ((__break_removes_preceding shl bp_TPangoLogAttr_break_removes_preceding) and bm_TPangoLogAttr_break_removes_preceding);
end;

function reserved(var a : TPangoLogAttr) : Tguint;
begin
  reserved:=(a.flag0 and bm_TPangoLogAttr_reserved) shr bp_TPangoLogAttr_reserved;
end;

procedure set_reserved(var a : TPangoLogAttr; __reserved : Tguint);
begin
  a.flag0:=a.flag0 or ((__reserved shl bp_TPangoLogAttr_reserved) and bm_TPangoLogAttr_reserved);
end;


end.
