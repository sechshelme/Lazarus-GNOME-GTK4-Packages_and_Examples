
unit hb_ot_color;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ot_color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ot_color.h
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
Pdword  = ^dword;
Phb_blob_t  = ^hb_blob_t;
Phb_color_t  = ^hb_color_t;
Phb_face_t  = ^hb_face_t;
Phb_font_t  = ^hb_font_t;
Phb_ot_color_layer_t  = ^hb_ot_color_layer_t;
Phb_ot_color_palette_flags_t  = ^hb_ot_color_palette_flags_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2016  Google, Inc.
 * Copyright © 2018  Khaled Hosny
 * Copyright © 2018  Ebrahim Byagowi
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Google Author(s): Sascha Brawer, Behdad Esfahbod
  }
{$if !defined(HB_OT_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb-ot.h> instead."}
{$endif}
{$ifndef HB_OT_COLOR_H}
{$define HB_OT_COLOR_H}
{$include "hb.h"}
{$include "hb-ot-name.h"}
{
 * Color palettes.
  }

function hb_ot_color_has_palettes(face:Phb_face_t):Thb_bool_t;cdecl;external;
function hb_ot_color_palette_get_count(face:Phb_face_t):dword;cdecl;external;
function hb_ot_color_palette_get_name_id(face:Phb_face_t; palette_index:dword):Thb_ot_name_id_t;cdecl;external;
function hb_ot_color_palette_color_get_name_id(face:Phb_face_t; color_index:dword):Thb_ot_name_id_t;cdecl;external;
{*
 * hb_ot_color_palette_flags_t:
 * @HB_OT_COLOR_PALETTE_FLAG_DEFAULT: Default indicating that there is nothing special
 *   to note about a color palette.
 * @HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_LIGHT_BACKGROUND: Flag indicating that the color
 *   palette is appropriate to use when displaying the font on a light background such as white.
 * @HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_DARK_BACKGROUND: Flag indicating that the color
 *   palette is appropriate to use when displaying the font on a dark background such as black.
 *
 * Flags that describe the properties of color palette.
 *
 * Since: 2.1.0
  }
{< flags > }
type
  Phb_ot_color_palette_flags_t = ^Thb_ot_color_palette_flags_t;
  Thb_ot_color_palette_flags_t =  Longint;
  Const
    HB_OT_COLOR_PALETTE_FLAG_DEFAULT = $00000000;
    HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_LIGHT_BACKGROUND = $00000001;
    HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_DARK_BACKGROUND = $00000002;
;

function hb_ot_color_palette_get_flags(face:Phb_face_t; palette_index:dword):Thb_ot_color_palette_flags_t;cdecl;external;
{ IN/OUT.  May be NULL.  }
{ OUT.     May be NULL.  }function hb_ot_color_palette_get_colors(face:Phb_face_t; palette_index:dword; start_offset:dword; color_count:Pdword; colors:Phb_color_t):dword;cdecl;external;
{
 * Color layers.
  }
function hb_ot_color_has_layers(face:Phb_face_t):Thb_bool_t;cdecl;external;
{*
 * hb_ot_color_layer_t:
 * @glyph: the glyph ID of the layer
 * @color_index: the palette color index of the layer
 *
 * Pairs of glyph and color index.
 *
 * A color index of 0xFFFF does not refer to a palette
 * color, but indicates that the foreground color should
 * be used.
 *
 * Since: 2.1.0
 * }
type
  Phb_ot_color_layer_t = ^Thb_ot_color_layer_t;
  Thb_ot_color_layer_t = record
      glyph : Thb_codepoint_t;
      color_index : dword;
    end;
{ IN/OUT.  May be NULL.  }
{ OUT.     May be NULL.  }
function hb_ot_color_glyph_get_layers(face:Phb_face_t; glyph:Thb_codepoint_t; start_offset:dword; layer_count:Pdword; layers:Phb_ot_color_layer_t):dword;cdecl;external;
{ COLRv1  }
function hb_ot_color_has_paint(face:Phb_face_t):Thb_bool_t;cdecl;external;
function hb_ot_color_glyph_has_paint(face:Phb_face_t; glyph:Thb_codepoint_t):Thb_bool_t;cdecl;external;
{
 * SVG
  }
function hb_ot_color_has_svg(face:Phb_face_t):Thb_bool_t;cdecl;external;
function hb_ot_color_glyph_reference_svg(face:Phb_face_t; glyph:Thb_codepoint_t):Phb_blob_t;cdecl;external;
{
 * PNG: CBDT or sbix
  }
function hb_ot_color_has_png(face:Phb_face_t):Thb_bool_t;cdecl;external;
function hb_ot_color_glyph_reference_png(font:Phb_font_t; glyph:Thb_codepoint_t):Phb_blob_t;cdecl;external;
{$endif}
{ HB_OT_COLOR_H  }

implementation


end.
