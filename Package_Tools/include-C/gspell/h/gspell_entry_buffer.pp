
unit gspell_entry_buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_entry_buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_entry_buffer.h
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
PGspellEntryBuffer  = ^GspellEntryBuffer;
PGtkEntryBuffer  = ^GtkEntryBuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2016 - Sébastien Wilmet
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
{$ifndef GSPELL_ENTRY_BUFFER_H}
{$define GSPELL_ENTRY_BUFFER_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gspell/gspell-checker.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_ENTRY_BUFFER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GspellEntryBuffer, gspell_entry_buffer, GSPELL, ENTRY_BUFFER, GObject) }
function gspell_entry_buffer_get_from_gtk_entry_buffer(gtk_buffer:PGtkEntryBuffer):PGspellEntryBuffer;cdecl;external;
function gspell_entry_buffer_get_buffer(gspell_buffer:PGspellEntryBuffer):PGtkEntryBuffer;cdecl;external;
function gspell_entry_buffer_get_spell_checker(gspell_buffer:PGspellEntryBuffer):PGspellChecker;cdecl;external;
procedure gspell_entry_buffer_set_spell_checker(gspell_buffer:PGspellEntryBuffer; spell_checker:PGspellChecker);cdecl;external;
{$endif}
{ GSPELL_ENTRY_BUFFER_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_ENTRY_BUFFER : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_ENTRY_BUFFER:=gspell_entry_buffer_get_type;
  end;


end.
