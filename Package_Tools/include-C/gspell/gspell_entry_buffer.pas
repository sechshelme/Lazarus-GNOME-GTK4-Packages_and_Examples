unit gspell_entry_buffer;

interface

uses
  fp_glib2;

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

{G_DECLARE_FINAL_TYPE (GspellEntryBuffer, gspell_entry_buffer, GSPELL, ENTRY_BUFFER, GObject) }
function gspell_entry_buffer_get_from_gtk_entry_buffer(gtk_buffer:PGtkEntryBuffer):PGspellEntryBuffer;cdecl;external libgspell;
function gspell_entry_buffer_get_buffer(gspell_buffer:PGspellEntryBuffer):PGtkEntryBuffer;cdecl;external libgspell;
function gspell_entry_buffer_get_spell_checker(gspell_buffer:PGspellEntryBuffer):PGspellChecker;cdecl;external libgspell;
procedure gspell_entry_buffer_set_spell_checker(gspell_buffer:PGspellEntryBuffer; spell_checker:PGspellChecker);cdecl;external libgspell;
{$endif}
{ GSPELL_ENTRY_BUFFER_H  }

// === Konventiert am: 4-8-26 16:42:17 ===

function GSPELL_TYPE_ENTRY_BUFFER: TGType;
function GSPELL_ENTRY_BUFFER(obj: Pointer): PGspellEntryBuffer;
function GSPELL_IS_ENTRY_BUFFER(obj: Pointer): Tgboolean;

implementation

function GSPELL_TYPE_ENTRY_BUFFER: TGType;
begin
  Result := gspell_entry_buffer_get_type;
end;

function GSPELL_ENTRY_BUFFER(obj: Pointer): PGspellEntryBuffer;
begin
  Result := PGspellEntryBuffer(g_type_check_instance_cast(obj, GSPELL_TYPE_ENTRY_BUFFER));
end;

function GSPELL_IS_ENTRY_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_ENTRY_BUFFER);
end;

type 
  PGspellEntryBuffer = type Pointer;

  TGspellEntryBufferClass = record
    parent_class: TGObjectClass;
  end;
  PGspellEntryBufferClass = ^TGspellEntryBufferClass;

function gspell_entry_buffer_get_type: TGType; cdecl; external libgxxxxxxx;



end.
