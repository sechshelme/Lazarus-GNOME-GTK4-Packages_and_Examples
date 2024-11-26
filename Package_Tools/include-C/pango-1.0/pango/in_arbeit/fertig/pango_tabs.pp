
unit pango_tabs;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_tabs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_tabs.h
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
Pgint  = ^gint;
PPangoTabAlign  = ^PangoTabAlign;
PPangoTabArray  = ^PangoTabArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-tabs.h: Tab-related stuff
 *
 * Copyright (C) 2000 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_TABS_H__}
{$define __PANGO_TABS_H__}
{$include <pango/pango-types.h>}
type
{*
 * PangoTabAlign:
 * @PANGO_TAB_LEFT: the text appears to the right of the tab stop position
 * @PANGO_TAB_RIGHT: the text appears to the left of the tab stop position
 *   until the available space is filled. Since: 1.50
 * @PANGO_TAB_CENTER: the text is centered at the tab stop position
 *   until the available space is filled. Since: 1.50
 * @PANGO_TAB_DECIMAL: text before the first occurrence of the decimal point
 *   character appears to the left of the tab stop position (until the available
 *   space is filled), the rest to the right. Since: 1.50
 *
 * `PangoTabAlign` specifies where the text appears relative to the tab stop
 * position.
  }

  PPangoTabAlign = ^TPangoTabAlign;
  TPangoTabAlign =  Longint;
  Const
    PANGO_TAB_LEFT = 0;
    PANGO_TAB_RIGHT = 1;
    PANGO_TAB_CENTER = 2;
    PANGO_TAB_DECIMAL = 3;
;

{ was #define dname def_expr }
function PANGO_TYPE_TAB_ARRAY : longint; { return type might be wrong }

function pango_tab_array_new(initial_size:Tgint; positions_in_pixels:Tgboolean):PPangoTabArray;cdecl;external;
function pango_tab_array_new_with_positions(size:Tgint; positions_in_pixels:Tgboolean; first_alignment:TPangoTabAlign; first_position:Tgint; args:array of const):PPangoTabArray;cdecl;external;
function pango_tab_array_new_with_positions(size:Tgint; positions_in_pixels:Tgboolean; first_alignment:TPangoTabAlign; first_position:Tgint):PPangoTabArray;cdecl;external;
function pango_tab_array_get_type:TGType;cdecl;external;
function pango_tab_array_copy(src:PPangoTabArray):PPangoTabArray;cdecl;external;
procedure pango_tab_array_free(tab_array:PPangoTabArray);cdecl;external;
function pango_tab_array_get_size(tab_array:PPangoTabArray):Tgint;cdecl;external;
procedure pango_tab_array_resize(tab_array:PPangoTabArray; new_size:Tgint);cdecl;external;
procedure pango_tab_array_set_tab(tab_array:PPangoTabArray; tab_index:Tgint; alignment:TPangoTabAlign; location:Tgint);cdecl;external;
procedure pango_tab_array_get_tab(tab_array:PPangoTabArray; tab_index:Tgint; alignment:PPangoTabAlign; location:Pgint);cdecl;external;
procedure pango_tab_array_get_tabs(tab_array:PPangoTabArray; alignments:PPPangoTabAlign; locations:PPgint);cdecl;external;
function pango_tab_array_get_positions_in_pixels(tab_array:PPangoTabArray):Tgboolean;cdecl;external;
procedure pango_tab_array_set_positions_in_pixels(tab_array:PPangoTabArray; positions_in_pixels:Tgboolean);cdecl;external;
function pango_tab_array_to_string(tab_array:PPangoTabArray):Pchar;cdecl;external;
(* Const before type ignored *)
function pango_tab_array_from_string(text:Pchar):PPangoTabArray;cdecl;external;
procedure pango_tab_array_set_decimal_point(tab_array:PPangoTabArray; tab_index:longint; decimal_point:Tgunichar);cdecl;external;
function pango_tab_array_get_decimal_point(tab_array:PPangoTabArray; tab_index:longint):Tgunichar;cdecl;external;
procedure pango_tab_array_sort(tab_array:PPangoTabArray);cdecl;external;
{$endif}
{ __PANGO_TABS_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_TAB_ARRAY : longint; { return type might be wrong }
  begin
    PANGO_TYPE_TAB_ARRAY:=pango_tab_array_get_type;
  end;


end.
