
unit pango_glyph_item;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_glyph_item.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_glyph_item.h
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
Pgchar  = ^gchar;
PGSList  = ^GSList;
Plongint  = ^longint;
PPangoAttrList  = ^PangoAttrList;
PPangoGlyphItem  = ^PangoGlyphItem;
PPangoGlyphItemIter  = ^PangoGlyphItemIter;
PPangoGlyphString  = ^PangoGlyphString;
PPangoItem  = ^PangoItem;
PPangoLogAttr  = ^PangoLogAttr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-glyph-item.h: Pair of PangoItem and a glyph string
 *
 * Copyright (C) 2002 Red Hat Software
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
{$ifndef __PANGO_GLYPH_ITEM_H__}
{$define __PANGO_GLYPH_ITEM_H__}
{$include <pango/pango-attributes.h>}
{$include <pango/pango-break.h>}
{$include <pango/pango-item.h>}
{$include <pango/pango-glyph.h>}
{*
 * PangoGlyphItem:
 * @item: corresponding `PangoItem`
 * @glyphs: corresponding `PangoGlyphString`
 * @y_offset: shift of the baseline, relative to the baseline
 *   of the containing line. Positive values shift upwards
 * @start_x_offset: horizontal displacement to apply before the
 *   glyph item. Positive values shift right
 * @end_x_offset: horizontal displacement to apply after th
 *   glyph item. Positive values shift right
 *
 * A `PangoGlyphItem` is a pair of a `PangoItem` and the glyphs
 * resulting from shaping the items text.
 *
 * As an example of the usage of `PangoGlyphItem`, the results
 * of shaping text with `PangoLayout` is a list of `PangoLayoutLine`,
 * each of which contains a list of `PangoGlyphItem`.
  }
type
  PPangoGlyphItem = ^TPangoGlyphItem;
  TPangoGlyphItem = record
      item : PPangoItem;
      glyphs : PPangoGlyphString;
      y_offset : longint;
      start_x_offset : longint;
      end_x_offset : longint;
    end;


{ was #define dname def_expr }
function PANGO_TYPE_GLYPH_ITEM : longint; { return type might be wrong }

function pango_glyph_item_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function pango_glyph_item_split(orig:PPangoGlyphItem; text:Pchar; split_index:longint):PPangoGlyphItem;cdecl;external;
function pango_glyph_item_copy(orig:PPangoGlyphItem):PPangoGlyphItem;cdecl;external;
procedure pango_glyph_item_free(glyph_item:PPangoGlyphItem);cdecl;external;
(* Const before type ignored *)
function pango_glyph_item_apply_attrs(glyph_item:PPangoGlyphItem; text:Pchar; list:PPangoAttrList):PGSList;cdecl;external;
(* Const before type ignored *)
procedure pango_glyph_item_letter_space(glyph_item:PPangoGlyphItem; text:Pchar; log_attrs:PPangoLogAttr; letter_spacing:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_glyph_item_get_logical_widths(glyph_item:PPangoGlyphItem; text:Pchar; logical_widths:Plongint);cdecl;external;
{*
 * PangoGlyphItemIter:
 *
 * A `PangoGlyphItemIter` is an iterator over the clusters in a
 * `PangoGlyphItem`.
 *
 * The *forward direction* of the iterator is the logical direction of text.
 * That is, with increasing @start_index and @start_char values. If @glyph_item
 * is right-to-left (that is, if `glyph_item->item->analysis.level` is odd),
 * then @start_glyph decreases as the iterator moves forward.  Moreover,
 * in right-to-left cases, @start_glyph is greater than @end_glyph.
 *
 * An iterator should be initialized using either
 * pango_glyph_item_iter_init_start() or
 * pango_glyph_item_iter_init_end(), for forward and backward iteration
 * respectively, and walked over using any desired mixture of
 * pango_glyph_item_iter_next_cluster() and
 * pango_glyph_item_iter_prev_cluster().
 *
 * A common idiom for doing a forward iteration over the clusters is:
 *
 * ```
 * PangoGlyphItemIter cluster_iter;
 * gboolean have_cluster;
 *
 * for (have_cluster = pango_glyph_item_iter_init_start (&cluster_iter,
 *                                                       glyph_item, text);
 *      have_cluster;
 *      have_cluster = pango_glyph_item_iter_next_cluster (&cluster_iter))
 * 
 *   ...
 * 
 * ```
 *
 * Note that @text is the start of the text for layout, which is then
 * indexed by `glyph_item->item->offset` to get to the text of @glyph_item.
 * The @start_index and @end_index values can directly index into @text. The
 * @start_glyph, @end_glyph, @start_char, and @end_char values however are
 * zero-based for the @glyph_item.  For each cluster, the item pointed at by
 * the start variables is included in the cluster while the one pointed at by
 * end variables is not.
 *
 * None of the members of a `PangoGlyphItemIter` should be modified manually.
 *
 * Since: 1.22
  }
type
(* Const before type ignored *)
  PPangoGlyphItemIter = ^TPangoGlyphItemIter;
  TPangoGlyphItemIter = record
      glyph_item : PPangoGlyphItem;
      text : Pgchar;
      start_glyph : longint;
      start_index : longint;
      start_char : longint;
      end_glyph : longint;
      end_index : longint;
      end_char : longint;
    end;


{ was #define dname def_expr }
function PANGO_TYPE_GLYPH_ITEM_ITER : longint; { return type might be wrong }

function pango_glyph_item_iter_get_type:TGType;cdecl;external;
function pango_glyph_item_iter_copy(orig:PPangoGlyphItemIter):PPangoGlyphItemIter;cdecl;external;
procedure pango_glyph_item_iter_free(iter:PPangoGlyphItemIter);cdecl;external;
(* Const before type ignored *)
function pango_glyph_item_iter_init_start(iter:PPangoGlyphItemIter; glyph_item:PPangoGlyphItem; text:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_glyph_item_iter_init_end(iter:PPangoGlyphItemIter; glyph_item:PPangoGlyphItem; text:Pchar):Tgboolean;cdecl;external;
function pango_glyph_item_iter_next_cluster(iter:PPangoGlyphItemIter):Tgboolean;cdecl;external;
function pango_glyph_item_iter_prev_cluster(iter:PPangoGlyphItemIter):Tgboolean;cdecl;external;
{$endif}
{ __PANGO_GLYPH_ITEM_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_GLYPH_ITEM : longint; { return type might be wrong }
  begin
    PANGO_TYPE_GLYPH_ITEM:=pango_glyph_item_get_type;
  end;

{ was #define dname def_expr }
function PANGO_TYPE_GLYPH_ITEM_ITER : longint; { return type might be wrong }
  begin
    PANGO_TYPE_GLYPH_ITEM_ITER:=pango_glyph_item_iter_get_type;
  end;


end.
