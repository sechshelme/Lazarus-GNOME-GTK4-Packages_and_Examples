unit gspell_text_buffer;

interface

uses
  fp_glib2;

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

{G_DECLARE_FINAL_TYPE (GspellTextBuffer, gspell_text_buffer, GSPELL, TEXT_BUFFER, GObject) }
function gspell_text_buffer_get_from_gtk_text_buffer(gtk_buffer:PGtkTextBuffer):PGspellTextBuffer;cdecl;external libgspell;
function gspell_text_buffer_get_buffer(gspell_buffer:PGspellTextBuffer):PGtkTextBuffer;cdecl;external libgspell;
function gspell_text_buffer_get_spell_checker(gspell_buffer:PGspellTextBuffer):PGspellChecker;cdecl;external libgspell;
procedure gspell_text_buffer_set_spell_checker(gspell_buffer:PGspellTextBuffer; spell_checker:PGspellChecker);cdecl;external libgspell;
{$endif}
{ GSPELL_TEXT_BUFFER_H  }

// === Konventiert am: 4-8-26 16:41:48 ===

function GSPELL_TYPE_TEXT_BUFFER: TGType;
function GSPELL_TEXT_BUFFER(obj: Pointer): PGspellTextBuffer;
function GSPELL_IS_TEXT_BUFFER(obj: Pointer): Tgboolean;

implementation

function GSPELL_TYPE_TEXT_BUFFER: TGType;
begin
  Result := gspell_text_buffer_get_type;
end;

function GSPELL_TEXT_BUFFER(obj: Pointer): PGspellTextBuffer;
begin
  Result := PGspellTextBuffer(g_type_check_instance_cast(obj, GSPELL_TYPE_TEXT_BUFFER));
end;

function GSPELL_IS_TEXT_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_TEXT_BUFFER);
end;

type 
  PGspellTextBuffer = type Pointer;

  TGspellTextBufferClass = record
    parent_class: TGObjectClass;
  end;
  PGspellTextBufferClass = ^TGspellTextBufferClass;

function gspell_text_buffer_get_type: TGType; cdecl; external libgxxxxxxx;



end.
