unit gspell_entry;

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
{$ifndef GSPELL_ENTRY_H}
{$define GSPELL_ENTRY_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}

{ G_DECLARE_FINAL_TYPE (GspellEntry, gspell_entry, GSPELL, ENTRY, GObject) }
function gspell_entry_get_from_gtk_entry(gtk_entry:PGtkEntry):PGspellEntry;cdecl;external libgspell;
procedure gspell_entry_basic_setup(gspell_entry:PGspellEntry);cdecl;external libgspell;
function gspell_entry_get_entry(gspell_entry:PGspellEntry):PGtkEntry;cdecl;external libgspell;
function gspell_entry_get_inline_spell_checking(gspell_entry:PGspellEntry):Tgboolean;cdecl;external libgspell;
procedure gspell_entry_set_inline_spell_checking(gspell_entry:PGspellEntry; enable:Tgboolean);cdecl;external libgspell;
{$endif}
{ GSPELL_ENTRY_H  }

// === Konventiert am: 4-8-26 16:42:20 ===

function GSPELL_TYPE_ENTRY: TGType;
function GSPELL_ENTRY(obj: Pointer): PGspellEntry;
function GSPELL_IS_ENTRY(obj: Pointer): Tgboolean;

implementation

function GSPELL_TYPE_ENTRY: TGType;
begin
  Result := gspell_entry_get_type;
end;

function GSPELL_ENTRY(obj: Pointer): PGspellEntry;
begin
  Result := PGspellEntry(g_type_check_instance_cast(obj, GSPELL_TYPE_ENTRY));
end;

function GSPELL_IS_ENTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_ENTRY);
end;

type 
  PGspellEntry = type Pointer;

  TGspellEntryClass = record
    parent_class: TGObjectClass;
  end;
  PGspellEntryClass = ^TGspellEntryClass;

function gspell_entry_get_type: TGType; cdecl; external libgxxxxxxx;



end.
