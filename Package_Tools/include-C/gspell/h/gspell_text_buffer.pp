
unit gspell_text_buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_text_buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_text_buffer.h
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
PGspellChecker  = ^GspellChecker;
PGspellTextBuffer  = ^GspellTextBuffer;
PGtkTextBuffer  = ^GtkTextBuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2015, 2016 - Sébastien Wilmet
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GSPELL_TEXT_BUFFER_H}
{$define GSPELL_TEXT_BUFFER_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gspell/gspell-checker.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_TEXT_BUFFER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GspellTextBuffer, gspell_text_buffer, GSPELL, TEXT_BUFFER, GObject) }
function gspell_text_buffer_get_from_gtk_text_buffer(gtk_buffer:PGtkTextBuffer):PGspellTextBuffer;cdecl;external;
function gspell_text_buffer_get_buffer(gspell_buffer:PGspellTextBuffer):PGtkTextBuffer;cdecl;external;
function gspell_text_buffer_get_spell_checker(gspell_buffer:PGspellTextBuffer):PGspellChecker;cdecl;external;
procedure gspell_text_buffer_set_spell_checker(gspell_buffer:PGspellTextBuffer; spell_checker:PGspellChecker);cdecl;external;
{$endif}
{ GSPELL_TEXT_BUFFER_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_TEXT_BUFFER : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_TEXT_BUFFER:=gspell_text_buffer_get_type;
  end;


end.
