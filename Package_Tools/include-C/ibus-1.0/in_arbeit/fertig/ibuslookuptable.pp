
unit ibuslookuptable;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibuslookuptable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibuslookuptable.h
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
PGArray  = ^GArray;
PIBusLookupTable  = ^IBusLookupTable;
PIBusLookupTableClass  = ^IBusLookupTableClass;
PIBusText  = ^IBusText;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ IBus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2008-2013 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_LOOKUP_TABLE_H_}
{$define __IBUS_LOOKUP_TABLE_H_}
{*
 * SECTION: ibuslookuptable
 * @short_description: Candidate word/phrase lookup table.
 * @stability: Stable
 *
 * An IBusLookuptable stores the candidate words or phrases for users to
 * choose from.
 *
 * Use ibus_engine_update_lookup_table(), ibus_engine_show_lookup_table(),
 * and ibus_engine_hide_lookup_table() to update, show and hide the lookup
 * table.
 *
 * see_also: #IBusEngine
  }
{$include "ibusserializable.h"}
{$include "ibustext.h"}
{
 * Type macros.
  }
{ define IBusLookupTable macros  }

{ was #define dname def_expr }
function IBUS_TYPE_LOOKUP_TABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_LOOKUP_TABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_LOOKUP_TABLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_LOOKUP_TABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_LOOKUP_TABLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_LOOKUP_TABLE_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusLookupTable:
 * @page_size: number of candidate shown per page.
 * @cursor_pos: position index of cursor.
 * @cursor_visible: whether the cursor is visible.
 * @round: TRUE for lookup table wrap around.
 * @orientation: orientation of the table.
 * @candidates: Candidate words/phrases.
 * @labels: Candidate labels which identify individual candidates in the same page. Default is 1, 2, 3, 4 ...
 *
 * An IBusLookuptable stores the candidate words or phrases for users to choose from.
 * Note that some input methods allow you to select candidate by pressing non-numeric
 * keys such as "asdfghjkl;".
 * Developers of these input methods should change the labels with
 * ibus_lookup_table_append_label().
  }
{< public > }
  PIBusLookupTable = ^TIBusLookupTable;
  TIBusLookupTable = record
      parent : TIBusSerializable;
      page_size : Tguint;
      cursor_pos : Tguint;
      cursor_visible : Tgboolean;
      round : Tgboolean;
      orientation : Tgint;
      candidates : PGArray;
      labels : PGArray;
    end;

  PIBusLookupTableClass = ^TIBusLookupTableClass;
  TIBusLookupTableClass = record
      parent : TIBusSerializableClass;
    end;


function ibus_lookup_table_get_type:TGType;cdecl;external;
{*
 * ibus_lookup_table_new:
 * @page_size: number of candidate shown per page, the max value is 16.
 * @cursor_pos: position index of cursor.
 * @cursor_visible: whether the cursor is visible.
 * @round: TRUE for lookup table wrap around.
 *
 * Craetes a new #IBusLookupTable.
 *
 * Returns: A newly allocated #IBusLookupTable.
  }
function ibus_lookup_table_new(page_size:Tguint; cursor_pos:Tguint; cursor_visible:Tgboolean; round:Tgboolean):PIBusLookupTable;cdecl;external;
{*
 * ibus_lookup_table_append_candidate:
 * @table: An IBusLookupTable.
 * @text: candidate word/phrase to be appended (in IBusText format).
 *
 * Append a candidate word/phrase to IBusLookupTable, and increase reference.
  }
procedure ibus_lookup_table_append_candidate(table:PIBusLookupTable; text:PIBusText);cdecl;external;
{*
 * ibus_lookup_table_get_number_of_candidates:
 * @table: An IBusLookupTable.
 *
 * Return the number of candidate in the table.
 *
 * Returns: The number of candidates in the table
  }
function ibus_lookup_table_get_number_of_candidates(table:PIBusLookupTable):Tguint;cdecl;external;
{*
 * ibus_lookup_table_get_candidate:
 * @table: An IBusLookupTable.
 * @index: Index in the Lookup table.
 *
 * Return #IBusText at the given index. Borrowed reference.
 *
 * Returns: (transfer none): IBusText at the given index; NULL if no such
 *         #IBusText.
  }
function ibus_lookup_table_get_candidate(table:PIBusLookupTable; index:Tguint):PIBusText;cdecl;external;
{*
 * ibus_lookup_table_append_label:
 * @table: An IBusLookupTable.
 * @text: A candidate label to be appended (in IBusText format).
 *
 * Append a candidate word/phrase to IBusLookupTable, and increase reference.
 * This function is needed if the input method select candidate with
 * non-numeric keys such as "asdfghjkl;".
  }
procedure ibus_lookup_table_append_label(table:PIBusLookupTable; text:PIBusText);cdecl;external;
{*
 * ibus_lookup_table_set_label:
 * @table: An IBusLookupTable.
 * @index: Intex in the Lookup table.
 * @text: A candidate label to be appended (in IBusText format).
 *
 * Append a candidate word/phrase to IBusLookupTable, and increase reference.
 * This function is needed if the input method select candidate with
 * non-numeric keys such as "asdfghjkl;".
  }
procedure ibus_lookup_table_set_label(table:PIBusLookupTable; index:Tguint; text:PIBusText);cdecl;external;
{*
 * ibus_lookup_table_get_label:
 * @table: An IBusLookupTable.
 * @index: Index in the Lookup table.
 *
 * Return #IBusText at the given index. Borrowed reference.
 *
 * Returns: (transfer none): #IBusText at the given index; %NULL if no such
 *         #IBusText.
  }
function ibus_lookup_table_get_label(table:PIBusLookupTable; index:Tguint):PIBusText;cdecl;external;
{*
 * ibus_lookup_table_set_cursor_pos:
 * @table: An IBusLookupTable.
 * @cursor_pos: The position of cursor.
 *
 * Set the cursor position of IBusLookupTable.
  }
procedure ibus_lookup_table_set_cursor_pos(table:PIBusLookupTable; cursor_pos:Tguint);cdecl;external;
{*
 * ibus_lookup_table_get_cursor_pos:
 * @table: An IBusLookupTable.
 *
 * Gets the cursor position of #IBusLookupTable.
 *
 * Returns: The position of cursor.
  }
function ibus_lookup_table_get_cursor_pos(table:PIBusLookupTable):Tguint;cdecl;external;
{*
 * ibus_lookup_table_set_cursor_visible:
 * @table: An IBusLookupTable.
 * @visible: Whether to make the cursor of @table visible.
 *
 * Set whether to make the cursor of an IBusLookupTable visible or not.
  }
procedure ibus_lookup_table_set_cursor_visible(table:PIBusLookupTable; visible:Tgboolean);cdecl;external;
{*
 * ibus_lookup_table_is_cursor_visible:
 * @table: An #IBusLookupTable.
 *
 * Returns whether the cursor of an #IBusLookupTable is visible.
 *
 * Returns: Whether the cursor of @table is visible.
  }
function ibus_lookup_table_is_cursor_visible(table:PIBusLookupTable):Tgboolean;cdecl;external;
{*
 * ibus_lookup_table_get_cursor_in_page:
 * @table: An IBusLookupTable.
 *
 * Gets the cursor position in current page of #IBusLookupTable.
 *
 * Returns: The position of cursor in current page.
  }
function ibus_lookup_table_get_cursor_in_page(table:PIBusLookupTable):Tguint;cdecl;external;
{*
 * ibus_lookup_table_set_page_size:
 * @table: An IBusLookupTable.
 * @page_size: number of candidate shown per page.
 *
 * Set the number of candidate shown per page.
  }
procedure ibus_lookup_table_set_page_size(table:PIBusLookupTable; page_size:Tguint);cdecl;external;
{*
 * ibus_lookup_table_get_page_size:
 * @table: An IBusLookupTable.
 *
 * Gets the number of candidate shown per page.
 *
 * Returns: Page size, i.e., number of candidate shown per page.
dd
  }
function ibus_lookup_table_get_page_size(table:PIBusLookupTable):Tguint;cdecl;external;
{*
 * ibus_lookup_table_set_round:
 * @table: An IBusLookupTable.
 * @round: Whether to make @table round.
 *
 * Set whether to make the IBusLookupTable round or not.
  }
procedure ibus_lookup_table_set_round(table:PIBusLookupTable; round:Tgboolean);cdecl;external;
{*
 * ibus_lookup_table_is_round:
 * @table: An IBusLookupTable.
 *
 * Returns whether the #IBusLookupTable is round.
 *
 * Returns: Whether the @table is round.
  }
function ibus_lookup_table_is_round(table:PIBusLookupTable):Tgboolean;cdecl;external;
{*
 * ibus_lookup_table_set_orientation:
 * @table: An IBusLookupTable.
 * @orientation: .
 *
 * Set the orientation.
  }
procedure ibus_lookup_table_set_orientation(table:PIBusLookupTable; orientation:Tgint);cdecl;external;
{*
 * ibus_lookup_table_get_orientation:
 * @table: An IBusLookupTable.
 *
 * Returns the orientation of the #IBusLookupTable.
 *
 * Returns: The orientation of the @table.
  }
function ibus_lookup_table_get_orientation(table:PIBusLookupTable):Tgint;cdecl;external;
{*
 * ibus_lookup_table_clear:
 * @table: An IBusLookupTable.
 *
 * Clear and remove all candidate from an IBusLookupTable.
  }
procedure ibus_lookup_table_clear(table:PIBusLookupTable);cdecl;external;
{*
 * ibus_lookup_table_page_up:
 * @table: An IBusLookupTable.
 *
 * Go to previous page of an #IBusLookupTable.
 *
 * It returns FALSE if it is already at the first page,
 * unless  <code>table&gt;-round==TRUE</code>, where it will go
 * to the last page.
 *
 * Returns: %TRUE if succeed.
  }
function ibus_lookup_table_page_up(table:PIBusLookupTable):Tgboolean;cdecl;external;
{*
 * ibus_lookup_table_page_down:
 * @table: An IBusLookupTable.
 *
 * Go to next page of an #IBusLookupTable.
 *
 * It returns FALSE if it is already at the last page,
 * unless  <code>table&gt;-round==TRUE</code>, where it will go
 * to the first page.
 *
 * Returns: %TRUE if succeed.
  }
function ibus_lookup_table_page_down(table:PIBusLookupTable):Tgboolean;cdecl;external;
{*
 * ibus_lookup_table_cursor_up:
 * @table: An IBusLookupTable.
 *
 * Go to previous candidate of an #IBusLookupTable.
 *
 * It returns FALSE if it is already at the first candidate,
 * unless  <code>table&gt;-round==TRUE</code>, where it will go
 * to the last candidate.
 *
 * Returns: %TRUE if succeed.
  }
function ibus_lookup_table_cursor_up(table:PIBusLookupTable):Tgboolean;cdecl;external;
{*
 * ibus_lookup_table_cursor_down:
 * @table: An IBusLookupTable.
 *
 * Go to next candidate of an #IBusLookupTable.
 *
 * It returns FALSE if it is already at the last candidate,
 * unless  <code>table&gt;-round==TRUE</code>, where it will go
 * to the first candidate.
 *
 * Returns: %TRUE if succeed.
  }
function ibus_lookup_table_cursor_down(table:PIBusLookupTable):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_LOOKUP_TABLE : longint; { return type might be wrong }
  begin
    IBUS_TYPE_LOOKUP_TABLE:=ibus_lookup_table_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_LOOKUP_TABLE(obj : longint) : longint;
begin
  IBUS_LOOKUP_TABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_LOOKUP_TABLE,IBusLookupTable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_LOOKUP_TABLE_CLASS(klass : longint) : longint;
begin
  IBUS_LOOKUP_TABLE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_LOOKUP_TABLE,IBusLookupTableClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_LOOKUP_TABLE(obj : longint) : longint;
begin
  IBUS_IS_LOOKUP_TABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_LOOKUP_TABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_LOOKUP_TABLE_CLASS(klass : longint) : longint;
begin
  IBUS_IS_LOOKUP_TABLE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_LOOKUP_TABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_LOOKUP_TABLE_GET_CLASS(obj : longint) : longint;
begin
  IBUS_LOOKUP_TABLE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_LOOKUP_TABLE,IBusLookupTableClass);
end;


end.
