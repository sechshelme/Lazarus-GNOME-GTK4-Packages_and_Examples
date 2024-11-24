
unit pango_item;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_item.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_item.h
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
PGList  = ^GList;
PGSList  = ^GSList;
PPangoAnalysis  = ^PangoAnalysis;
PPangoAttrIterator  = ^PangoAttrIterator;
PPangoAttrList  = ^PangoAttrList;
PPangoContext  = ^PangoContext;
PPangoEngineLang  = ^PangoEngineLang;
PPangoEngineShape  = ^PangoEngineShape;
PPangoFont  = ^PangoFont;
PPangoItem  = ^PangoItem;
PPangoLanguage  = ^PangoLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-item.h: Structure for storing run information
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_ITEM_H__}
{$define __PANGO_ITEM_H__}
{$include <pango/pango-types.h>}
{$include <pango/pango-attributes.h>}
type
{*
 * PANGO_ANALYSIS_FLAG_CENTERED_BASELINE:
 *
 * Whether the segment should be shifted to center around the baseline.
 *
 * This is mainly used in vertical writing directions.
 *
 * Since: 1.16
  }

const
  PANGO_ANALYSIS_FLAG_CENTERED_BASELINE = 1 shl 0;  
{*
 * PANGO_ANALYSIS_FLAG_IS_ELLIPSIS:
 *
 * Whether this run holds ellipsized text.
 *
 * Since: 1.36.7
  }
  PANGO_ANALYSIS_FLAG_IS_ELLIPSIS = 1 shl 1;  
{*
 * PANGO_ANALYSIS_FLAG_NEED_HYPHEN:
 *
 * Whether to add a hyphen at the end of the run during shaping.
 *
 * Since: 1.44
  }
  PANGO_ANALYSIS_FLAG_NEED_HYPHEN = 1 shl 2;  
{*
 * PangoAnalysis:
 * @shape_engine: unused, reserved
 * @lang_engine: unused, reserved
 * @font: the font for this segment.
 * @level: the bidirectional level for this segment.
 * @gravity: the glyph orientation for this segment (A `PangoGravity`).
 * @flags: boolean flags for this segment (Since: 1.16).
 * @script: the detected script for this segment (A `PangoScript`) (Since: 1.18).
 * @language: the detected language for this segment.
 * @extra_attrs: extra attributes for this segment.
 *
 * The `PangoAnalysis` structure stores information about
 * the properties of a segment of text.
  }
{$ifndef __GI_SCANNER__}
{$else}
{$endif}
type
  PPangoAnalysis = ^TPangoAnalysis;
  TPangoAnalysis = record
      shape_engine : PPangoEngineShape;
      lang_engine : PPangoEngineLang;
      shape_engine : Tgpointer;
      lang_engine : Tgpointer;
      font : PPangoFont;
      level : Tguint8;
      gravity : Tguint8;
      flags : Tguint8;
      script : Tguint8;
      language : PPangoLanguage;
      extra_attrs : PGSList;
    end;

{*
 * PangoItem:
 * @offset: byte offset of the start of this item in text.
 * @length: length of this item in bytes.
 * @num_chars: number of Unicode characters in the item.
 * @char_offset: character offset of the start of this item in text. Since 1.50
 * @analysis: analysis results for the item.
 *
 * The `PangoItem` structure stores information about a segment of text.
 *
 * You typically obtain `PangoItems` by itemizing a piece of text
 * with [func@itemize].
  }
  PPangoItem = ^TPangoItem;
  TPangoItem = record
      offset : longint;
      length : longint;
      num_chars : longint;
      analysis : TPangoAnalysis;
    end;


{ was #define dname def_expr }
function PANGO_TYPE_ITEM : longint; { return type might be wrong }

function pango_item_get_type:TGType;cdecl;external;
function pango_item_new:PPangoItem;cdecl;external;
function pango_item_copy(item:PPangoItem):PPangoItem;cdecl;external;
procedure pango_item_free(item:PPangoItem);cdecl;external;
function pango_item_split(orig:PPangoItem; split_index:longint; split_offset:longint):PPangoItem;cdecl;external;
procedure pango_item_apply_attrs(item:PPangoItem; iter:PPangoAttrIterator);cdecl;external;
function pango_reorder_items(items:PGList):PGList;cdecl;external;
{ Itemization  }
(* Const before type ignored *)
function pango_itemize(context:PPangoContext; text:Pchar; start_index:longint; length:longint; attrs:PPangoAttrList; 
           cached_iter:PPangoAttrIterator):PGList;cdecl;external;
(* Const before type ignored *)
function pango_itemize_with_base_dir(context:PPangoContext; base_dir:TPangoDirection; text:Pchar; start_index:longint; length:longint; 
           attrs:PPangoAttrList; cached_iter:PPangoAttrIterator):PGList;cdecl;external;
{$endif}
{ __PANGO_ITEM_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_ITEM : longint; { return type might be wrong }
  begin
    PANGO_TYPE_ITEM:=pango_item_get_type;
  end;


end.
