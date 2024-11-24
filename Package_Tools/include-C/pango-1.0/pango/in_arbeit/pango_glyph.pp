
unit pango_glyph;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_glyph.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_glyph.h
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
Plongint  = ^longint;
PPangoAnalysis  = ^PangoAnalysis;
PPangoFont  = ^PangoFont;
PPangoGlyphGeometry  = ^PangoGlyphGeometry;
PPangoGlyphInfo  = ^PangoGlyphInfo;
PPangoGlyphString  = ^PangoGlyphString;
PPangoGlyphUnit  = ^PangoGlyphUnit;
PPangoGlyphVisAttr  = ^PangoGlyphVisAttr;
PPangoItem  = ^PangoItem;
PPangoLogAttr  = ^PangoLogAttr;
PPangoRectangle  = ^PangoRectangle;
PPangoShapeFlags  = ^PangoShapeFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-glyph.h: Glyph storage
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
{$ifndef __PANGO_GLYPH_H__}
{$define __PANGO_GLYPH_H__}
{$include <pango/pango-types.h>}
{$include <pango/pango-item.h>}
{$include <pango/pango-break.h>}
type
{ 1024ths of a device unit  }
{*
 * PangoGlyphUnit:
 *
 * The `PangoGlyphUnit` type is used to store dimensions within
 * Pango.
 *
 * Dimensions are stored in 1/PANGO_SCALE of a device unit.
 * (A device unit might be a pixel for screen display, or
 * a point on a printer.) PANGO_SCALE is currently 1024, and
 * may change in the future (unlikely though), but you should not
 * depend on its exact value.
 *
 * The PANGO_PIXELS() macro can be used to convert from glyph units
 * into device units with correct rounding.
  }

  PPangoGlyphUnit = ^TPangoGlyphUnit;
  TPangoGlyphUnit = Tgint32;
{ Positioning information about a glyph
  }
{*
 * PangoGlyphGeometry:
 * @width: the logical width to use for the the character.
 * @x_offset: horizontal offset from nominal character position.
 * @y_offset: vertical offset from nominal character position.
 *
 * The `PangoGlyphGeometry` structure contains width and positioning
 * information for a single glyph.
 *
 * Note that @width is not guaranteed to be the same as the glyph
 * extents. Kerning and other positioning applied during shaping will
 * affect both the @width and the @x_offset for the glyphs in the
 * glyph string that results from shaping.
 *
 * The information in this struct is intended for rendering the glyphs,
 * as follows:
 *
 * 1. Assume the current point is (x, y)
 * 2. Render the current glyph at (x + x_offset, y + y_offset),
 * 3. Advance the current point to (x + width, y)
 * 4. Render the next glyph
  }
  PPangoGlyphGeometry = ^TPangoGlyphGeometry;
  TPangoGlyphGeometry = record
      width : TPangoGlyphUnit;
      x_offset : TPangoGlyphUnit;
      y_offset : TPangoGlyphUnit;
    end;

{ Visual attributes of a glyph
  }
{*
 * PangoGlyphVisAttr:
 * @is_cluster_start: set for the first logical glyph in each cluster.
 * @is_color: set if the the font will render this glyph with color. Since 1.50
 *
 * A `PangoGlyphVisAttr` structure communicates information between
 * the shaping and rendering phases.
 *
 * Currently, it contains cluster start and color information.
 * More attributes may be added in the future.
 *
 * Clusters are stored in visual order, within the cluster, glyphs
 * are always ordered in logical order, since visual order is meaningless;
 * that is, in Arabic text, accent glyphs follow the glyphs for the
 * base character.
  }
  PPangoGlyphVisAttr = ^TPangoGlyphVisAttr;
  TPangoGlyphVisAttr = record
      flag0 : word;
    end;


const
  bm_TPangoGlyphVisAttr_is_cluster_start = $1;
  bp_TPangoGlyphVisAttr_is_cluster_start = 0;
  bm_TPangoGlyphVisAttr_is_color = $2;
  bp_TPangoGlyphVisAttr_is_color = 1;

function is_cluster_start(var a : TPangoGlyphVisAttr) : Tguint;
procedure set_is_cluster_start(var a : TPangoGlyphVisAttr; __is_cluster_start : Tguint);
function is_color(var a : TPangoGlyphVisAttr) : Tguint;
procedure set_is_color(var a : TPangoGlyphVisAttr; __is_color : Tguint);
{ A single glyph
  }
{*
 * PangoGlyphInfo:
 * @glyph: the glyph itself.
 * @geometry: the positional information about the glyph.
 * @attr: the visual attributes of the glyph.
 *
 * A `PangoGlyphInfo` structure represents a single glyph with
 * positioning information and visual attributes.
  }
type
  PPangoGlyphInfo = ^TPangoGlyphInfo;
  TPangoGlyphInfo = record
      glyph : TPangoGlyph;
      geometry : TPangoGlyphGeometry;
      attr : TPangoGlyphVisAttr;
    end;

{*
 * PangoGlyphString:
 * @num_glyphs: number of glyphs in this glyph string
 * @glyphs: (array length=num_glyphs): array of glyph information
 * @log_clusters: logical cluster info, indexed by the byte index
 *   within the text corresponding to the glyph string
 *
 * A `PangoGlyphString` is used to store strings of glyphs with geometry
 * and visual attribute information.
 *
 * The storage for the glyph information is owned by the structure
 * which simplifies memory management.
  }
{< private > }
  PPangoGlyphString = ^TPangoGlyphString;
  TPangoGlyphString = record
      num_glyphs : longint;
      glyphs : PPangoGlyphInfo;
      log_clusters : Plongint;
      space : longint;
    end;


{ was #define dname def_expr }
function PANGO_TYPE_GLYPH_STRING : longint; { return type might be wrong }

function pango_glyph_string_get_type:TGType;cdecl;external;
function pango_glyph_string_new:PPangoGlyphString;cdecl;external;
procedure pango_glyph_string_set_size(_string:PPangoGlyphString; new_len:longint);cdecl;external;
function pango_glyph_string_copy(_string:PPangoGlyphString):PPangoGlyphString;cdecl;external;
procedure pango_glyph_string_free(_string:PPangoGlyphString);cdecl;external;
procedure pango_glyph_string_extents(glyphs:PPangoGlyphString; font:PPangoFont; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external;
function pango_glyph_string_get_width(glyphs:PPangoGlyphString):longint;cdecl;external;
procedure pango_glyph_string_extents_range(glyphs:PPangoGlyphString; start:longint; end:longint; font:PPangoFont; ink_rect:PPangoRectangle; 
            logical_rect:PPangoRectangle);cdecl;external;
(* Const before type ignored *)
procedure pango_glyph_string_get_logical_widths(glyphs:PPangoGlyphString; text:Pchar; length:longint; embedding_level:longint; logical_widths:Plongint);cdecl;external;
(* Const before type ignored *)
procedure pango_glyph_string_index_to_x(glyphs:PPangoGlyphString; text:Pchar; length:longint; analysis:PPangoAnalysis; index_:longint; 
            trailing:Tgboolean; x_pos:Plongint);cdecl;external;
(* Const before type ignored *)
procedure pango_glyph_string_x_to_index(glyphs:PPangoGlyphString; text:Pchar; length:longint; analysis:PPangoAnalysis; x_pos:longint; 
            index_:Plongint; trailing:Plongint);cdecl;external;
(* Const before type ignored *)
procedure pango_glyph_string_index_to_x_full(glyphs:PPangoGlyphString; text:Pchar; length:longint; analysis:PPangoAnalysis; attrs:PPangoLogAttr; 
            index_:longint; trailing:Tgboolean; x_pos:Plongint);cdecl;external;
{ Shaping  }
{*
 * PangoShapeFlags:
 * @PANGO_SHAPE_NONE: Default value
 * @PANGO_SHAPE_ROUND_POSITIONS: Round glyph positions and widths to whole device units
 *   This option should be set if the target renderer can't do subpixel positioning of glyphs
 *
 * Flags influencing the shaping process.
 *
 * `PangoShapeFlags` can be passed to [func@Pango.shape_with_flags].
 *
 * Since: 1.44
  }
type
  PPangoShapeFlags = ^TPangoShapeFlags;
  TPangoShapeFlags =  Longint;
  Const
    PANGO_SHAPE_NONE = 0;
    PANGO_SHAPE_ROUND_POSITIONS = 1 shl 0;
;
(* Const before type ignored *)
(* Const before type ignored *)

procedure pango_shape(text:Pchar; length:longint; analysis:PPangoAnalysis; glyphs:PPangoGlyphString);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure pango_shape_full(item_text:Pchar; item_length:longint; paragraph_text:Pchar; paragraph_length:longint; analysis:PPangoAnalysis; 
            glyphs:PPangoGlyphString);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure pango_shape_with_flags(item_text:Pchar; item_length:longint; paragraph_text:Pchar; paragraph_length:longint; analysis:PPangoAnalysis; 
            glyphs:PPangoGlyphString; flags:TPangoShapeFlags);cdecl;external;
(* Const before type ignored *)
procedure pango_shape_item(item:PPangoItem; paragraph_text:Pchar; paragraph_length:longint; log_attrs:PPangoLogAttr; glyphs:PPangoGlyphString; 
            flags:TPangoShapeFlags);cdecl;external;
{$endif}
{ __PANGO_GLYPH_H__  }

implementation

function is_cluster_start(var a : TPangoGlyphVisAttr) : Tguint;
begin
  is_cluster_start:=(a.flag0 and bm_TPangoGlyphVisAttr_is_cluster_start) shr bp_TPangoGlyphVisAttr_is_cluster_start;
end;

procedure set_is_cluster_start(var a : TPangoGlyphVisAttr; __is_cluster_start : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_cluster_start shl bp_TPangoGlyphVisAttr_is_cluster_start) and bm_TPangoGlyphVisAttr_is_cluster_start);
end;

function is_color(var a : TPangoGlyphVisAttr) : Tguint;
begin
  is_color:=(a.flag0 and bm_TPangoGlyphVisAttr_is_color) shr bp_TPangoGlyphVisAttr_is_color;
end;

procedure set_is_color(var a : TPangoGlyphVisAttr; __is_color : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_color shl bp_TPangoGlyphVisAttr_is_color) and bm_TPangoGlyphVisAttr_is_color);
end;

{ was #define dname def_expr }
function PANGO_TYPE_GLYPH_STRING : longint; { return type might be wrong }
  begin
    PANGO_TYPE_GLYPH_STRING:=pango_glyph_string_get_type;
  end;


end.
