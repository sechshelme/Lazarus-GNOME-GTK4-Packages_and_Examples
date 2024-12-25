
unit hb_font;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_font.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_font.h
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
Pdword  = ^dword;
Phb_bool_t  = ^hb_bool_t;
Phb_codepoint_t  = ^hb_codepoint_t;
Phb_draw_funcs_t  = ^hb_draw_funcs_t;
Phb_face_t  = ^hb_face_t;
Phb_font_extents_t  = ^hb_font_extents_t;
Phb_font_funcs_t  = ^hb_font_funcs_t;
Phb_font_get_font_h_extents_func_t  = ^hb_font_get_font_h_extents_func_t;
Phb_font_get_font_v_extents_func_t  = ^hb_font_get_font_v_extents_func_t;
Phb_font_get_glyph_h_advance_func_t  = ^hb_font_get_glyph_h_advance_func_t;
Phb_font_get_glyph_h_advances_func_t  = ^hb_font_get_glyph_h_advances_func_t;
Phb_font_get_glyph_h_kerning_func_t  = ^hb_font_get_glyph_h_kerning_func_t;
Phb_font_get_glyph_h_origin_func_t  = ^hb_font_get_glyph_h_origin_func_t;
Phb_font_get_glyph_v_advance_func_t  = ^hb_font_get_glyph_v_advance_func_t;
Phb_font_get_glyph_v_advances_func_t  = ^hb_font_get_glyph_v_advances_func_t;
Phb_font_get_glyph_v_origin_func_t  = ^hb_font_get_glyph_v_origin_func_t;
Phb_font_t  = ^hb_font_t;
Phb_glyph_extents_t  = ^hb_glyph_extents_t;
Phb_paint_funcs_t  = ^hb_paint_funcs_t;
Phb_position_t  = ^hb_position_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
Phb_variation_t  = ^hb_variation_t;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009  Red Hat, Inc.
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
 * Red Hat Author(s): Behdad Esfahbod
  }
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_FONT_H}
{$define HB_FONT_H}
{$include "hb-common.h"}
{$include "hb-face.h"}
{$include "hb-draw.h"}
{$include "hb-paint.h"}
{
 * hb_font_funcs_t
  }
{*
 * hb_font_funcs_t:
 *
 * Data type containing a set of virtual methods used for
 * working on #hb_font_t font objects.
 *
 * HarfBuzz provides a lightweight default function for each of 
 * the methods in #hb_font_funcs_t. Client programs can implement
 * their own replacements for the individual font functions, as
 * needed, and replace the default by calling the setter for a
 * method.
 *
 * }
type

function hb_font_funcs_create:Phb_font_funcs_t;cdecl;external;
function hb_font_funcs_get_empty:Phb_font_funcs_t;cdecl;external;
function hb_font_funcs_reference(ffuncs:Phb_font_funcs_t):Phb_font_funcs_t;cdecl;external;
procedure hb_font_funcs_destroy(ffuncs:Phb_font_funcs_t);cdecl;external;
function hb_font_funcs_set_user_data(ffuncs:Phb_font_funcs_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_font_funcs_get_user_data(ffuncs:Phb_font_funcs_t; key:Phb_user_data_key_t):pointer;cdecl;external;
procedure hb_font_funcs_make_immutable(ffuncs:Phb_font_funcs_t);cdecl;external;
function hb_font_funcs_is_immutable(ffuncs:Phb_font_funcs_t):Thb_bool_t;cdecl;external;
{ font extents  }
{*
 * hb_font_extents_t:
 * @ascender: The height of typographic ascenders.
 * @descender: The depth of typographic descenders.
 * @line_gap: The suggested line-spacing gap.
 *
 * Font-wide extent values, measured in font units.
 *
 * Note that typically @ascender is positive and @descender
 * negative, in coordinate systems that grow up.
 * }
{< private > }
type
  Phb_font_extents_t = ^Thb_font_extents_t;
  Thb_font_extents_t = record
      ascender : Thb_position_t;
      descender : Thb_position_t;
      line_gap : Thb_position_t;
      reserved9 : Thb_position_t;
      reserved8 : Thb_position_t;
      reserved7 : Thb_position_t;
      reserved6 : Thb_position_t;
      reserved5 : Thb_position_t;
      reserved4 : Thb_position_t;
      reserved3 : Thb_position_t;
      reserved2 : Thb_position_t;
      reserved1 : Thb_position_t;
    end;
{ func types  }
{*
 * hb_font_get_font_extents_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @extents: (out): The font extents retrieved
 * @user_data: User data pointer passed by the caller
 *
 * This method should retrieve the extents for a font.
 *
 * }

  Thb_font_get_font_extents_func_t = function (font:Phb_font_t; font_data:pointer; extents:Phb_font_extents_t; user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_font_h_extents_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the extents for a font, for horizontal-direction
 * text segments. Extents must be returned in an #hb_glyph_extents output
 * parameter.
 * 
 * }

  Phb_font_get_font_h_extents_func_t = ^Thb_font_get_font_h_extents_func_t;
  Thb_font_get_font_h_extents_func_t = Thb_font_get_font_extents_func_t;
{*
 * hb_font_get_font_v_extents_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the extents for a font, for vertical-direction
 * text segments. Extents must be returned in an #hb_glyph_extents output
 * parameter.
 * 
 * }

  Phb_font_get_font_v_extents_func_t = ^Thb_font_get_font_v_extents_func_t;
  Thb_font_get_font_v_extents_func_t = Thb_font_get_font_extents_func_t;
{*
 * hb_font_get_nominal_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @unicode: The Unicode code point to query
 * @glyph: (out): The glyph ID retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the nominal glyph ID for a specified Unicode code
 * point. Glyph IDs must be returned in a #hb_codepoint_t output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 * }

  Thb_font_get_nominal_glyph_func_t = function (font:Phb_font_t; font_data:pointer; unicode:Thb_codepoint_t; glyph:Phb_codepoint_t; user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_variation_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @unicode: The Unicode code point to query
 * @variation_selector: The  variation-selector code point to query
 * @glyph: (out): The glyph ID retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the glyph ID for a specified Unicode code point
 * followed by a specified Variation Selector code point. Glyph IDs must be
 * returned in a #hb_codepoint_t output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 * }

  Thb_font_get_variation_glyph_func_t = function (font:Phb_font_t; font_data:pointer; unicode:Thb_codepoint_t; variation_selector:Thb_codepoint_t; glyph:Phb_codepoint_t; 
               user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_nominal_glyphs_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @count: number of code points to query
 * @first_unicode: The first Unicode code point to query
 * @unicode_stride: The stride between successive code points
 * @first_glyph: (out): The first glyph ID retrieved
 * @glyph_stride: The stride between successive glyph IDs
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the nominal glyph IDs for a sequence of
 * Unicode code points. Glyph IDs must be returned in a #hb_codepoint_t
 * output parameter.
 *
 * Return value: the number of code points processed
 * 
 * }
(* Const before type ignored *)

  Thb_font_get_nominal_glyphs_func_t = function (font:Phb_font_t; font_data:pointer; count:dword; first_unicode:Phb_codepoint_t; unicode_stride:dword; 
               first_glyph:Phb_codepoint_t; glyph_stride:dword; user_data:pointer):dword;cdecl;
{*
 * hb_font_get_glyph_advance_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advance for a specified glyph. The
 * method must return an #hb_position_t.
 * 
 * Return value: The advance of @glyph within @font
 *
 * }

  Thb_font_get_glyph_advance_func_t = function (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; user_data:pointer):Thb_position_t;cdecl;
{*
 * hb_font_get_glyph_h_advance_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advance for a specified glyph, in
 * horizontal-direction text segments. Advances must be returned in
 * an #hb_position_t output parameter.
 * 
 * }

  Phb_font_get_glyph_h_advance_func_t = ^Thb_font_get_glyph_h_advance_func_t;
  Thb_font_get_glyph_h_advance_func_t = Thb_font_get_glyph_advance_func_t;
{*
 * hb_font_get_glyph_v_advance_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advance for a specified glyph, in
 * vertical-direction text segments. Advances must be returned in
 * an #hb_position_t output parameter.
 * 
 * }

  Phb_font_get_glyph_v_advance_func_t = ^Thb_font_get_glyph_v_advance_func_t;
  Thb_font_get_glyph_v_advance_func_t = Thb_font_get_glyph_advance_func_t;
{*
 * hb_font_get_glyph_advances_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @count: The number of glyph IDs in the sequence queried
 * @first_glyph: The first glyph ID to query
 * @glyph_stride: The stride between successive glyph IDs
 * @first_advance: (out): The first advance retrieved
 * @advance_stride: The stride between successive advances
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advances for a sequence of glyphs.
 * 
 * }
(* Const before type ignored *)

  Thb_font_get_glyph_advances_func_t = procedure (font:Phb_font_t; font_data:pointer; count:dword; first_glyph:Phb_codepoint_t; glyph_stride:dword; 
                first_advance:Phb_position_t; advance_stride:dword; user_data:pointer);cdecl;
{*
 * hb_font_get_glyph_h_advances_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advances for a sequence of glyphs, in
 * horizontal-direction text segments.
 * 
 * }

  Phb_font_get_glyph_h_advances_func_t = ^Thb_font_get_glyph_h_advances_func_t;
  Thb_font_get_glyph_h_advances_func_t = Thb_font_get_glyph_advances_func_t;
{*
 * hb_font_get_glyph_v_advances_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advances for a sequence of glyphs, in
 * vertical-direction text segments.
 * 
 * }

  Phb_font_get_glyph_v_advances_func_t = ^Thb_font_get_glyph_v_advances_func_t;
  Thb_font_get_glyph_v_advances_func_t = Thb_font_get_glyph_advances_func_t;
{*
 * hb_font_get_glyph_origin_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @x: (out): The X coordinate of the origin
 * @y: (out): The Y coordinate of the origin
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) of the
 * origin for a glyph. Each coordinate must be returned in an #hb_position_t
 * output parameter.
 *
 * Return value: `true` if data found, `false` otherwise
 * 
 * }

  Thb_font_get_glyph_origin_func_t = function (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; x:Phb_position_t; y:Phb_position_t; 
               user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_glyph_h_origin_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) of the
 * origin for a glyph, for horizontal-direction text segments. Each
 * coordinate must be returned in an #hb_position_t output parameter.
 * 
 * }

  Phb_font_get_glyph_h_origin_func_t = ^Thb_font_get_glyph_h_origin_func_t;
  Thb_font_get_glyph_h_origin_func_t = Thb_font_get_glyph_origin_func_t;
{*
 * hb_font_get_glyph_v_origin_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) of the
 * origin for a glyph, for vertical-direction text segments. Each coordinate
 * must be returned in an #hb_position_t output parameter.
 * 
 * }

  Phb_font_get_glyph_v_origin_func_t = ^Thb_font_get_glyph_v_origin_func_t;
  Thb_font_get_glyph_v_origin_func_t = Thb_font_get_glyph_origin_func_t;
{*
 * hb_font_get_glyph_kerning_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @first_glyph: The glyph ID of the first glyph in the glyph pair
 * @second_glyph: The glyph ID of the second glyph in the glyph pair
 * @user_data: User data pointer passed by the caller
 *
 * This method should retrieve the kerning-adjustment value for a glyph-pair in
 * the specified font, for horizontal text segments.
 *
 * }

  Thb_font_get_glyph_kerning_func_t = function (font:Phb_font_t; font_data:pointer; first_glyph:Thb_codepoint_t; second_glyph:Thb_codepoint_t; user_data:pointer):Thb_position_t;cdecl;
{*
 * hb_font_get_glyph_h_kerning_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the kerning-adjustment value for a glyph-pair in
 * the specified font, for horizontal text segments.
 *
 * }

  Phb_font_get_glyph_h_kerning_func_t = ^Thb_font_get_glyph_h_kerning_func_t;
  Thb_font_get_glyph_h_kerning_func_t = Thb_font_get_glyph_kerning_func_t;
{*
 * hb_font_get_glyph_extents_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @extents: (out): The #hb_glyph_extents_t retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the extents for a specified glyph. Extents must be 
 * returned in an #hb_glyph_extents output parameter.
 *
 * Return value: `true` if data found, `false` otherwise
 * 
 * }

  Thb_font_get_glyph_extents_func_t = function (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; extents:Phb_glyph_extents_t; user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_glyph_contour_point_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @point_index: The contour-point index to query
 * @x: (out): The X value retrieved for the contour point
 * @y: (out): The Y value retrieved for the contour point
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) for a
 * specified contour point in a glyph. Each coordinate must be returned as
 * an #hb_position_t output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 * }

  Thb_font_get_glyph_contour_point_func_t = function (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; point_index:dword; x:Phb_position_t; 
               y:Phb_position_t; user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_glyph_name_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @name: (out) (array length=size): Name string retrieved for the glyph ID
 * @size: Length of the glyph-name string retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the glyph name that corresponds to a
 * glyph ID. The name should be returned in a string output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 * }

  Thb_font_get_glyph_name_func_t = function (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; name:Pchar; size:dword; 
               user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_get_glyph_from_name_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @name: (array length=len): The name string to query
 * @len: The length of the name queried
 * @glyph: (out): The glyph ID retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the glyph ID that corresponds to a glyph-name
 * string. 
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 * }
(* Const before type ignored *)
{ -1 means nul-terminated  }

  Thb_font_get_glyph_from_name_func_t = function (font:Phb_font_t; font_data:pointer; name:Pchar; len:longint; glyph:Phb_codepoint_t; 
               user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_font_draw_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @draw_funcs: The draw functions to send the shape data to
 * @draw_data: The data accompanying the draw functions
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * Since: 7.0.0
 *
 * }

  Thb_font_draw_glyph_func_t = procedure (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; draw_funcs:Phb_draw_funcs_t; draw_data:pointer; 
                user_data:pointer);cdecl;
{*
 * hb_font_paint_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @paint_funcs: The paint functions to use
 * @paint_data: The data accompanying the paint functions
 * @palette_index: The color palette to use
 * @foreground: The foreground color
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * Since: 7.0.0
  }

  Thb_font_paint_glyph_func_t = procedure (font:Phb_font_t; font_data:pointer; glyph:Thb_codepoint_t; paint_funcs:Phb_paint_funcs_t; paint_data:pointer; 
                palette_index:dword; foreground:Thb_color_t; user_data:pointer);cdecl;
{ func setters  }
{*
 * hb_font_funcs_set_font_h_extents_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_font_h_extents_func_t.
 *
 * Since: 1.1.2
 * }

procedure hb_font_funcs_set_font_h_extents_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_font_h_extents_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_font_v_extents_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_font_v_extents_func_t.
 *
 * Since: 1.1.2
 * }
procedure hb_font_funcs_set_font_v_extents_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_font_v_extents_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_nominal_glyph_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_nominal_glyph_func_t.
 *
 * Since: 1.2.3
 * }
procedure hb_font_funcs_set_nominal_glyph_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_nominal_glyph_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_nominal_glyphs_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_nominal_glyphs_func_t.
 *
 * Since: 2.0.0
 * }
procedure hb_font_funcs_set_nominal_glyphs_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_nominal_glyphs_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_variation_glyph_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_variation_glyph_func_t.
 *
 * Since: 1.2.3
 * }
procedure hb_font_funcs_set_variation_glyph_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_variation_glyph_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_h_advance_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_h_advance_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_h_advance_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_h_advance_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_v_advance_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_v_advance_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_v_advance_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_v_advance_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_h_advances_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_h_advances_func_t.
 *
 * Since: 1.8.6
 * }
procedure hb_font_funcs_set_glyph_h_advances_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_h_advances_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_v_advances_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_v_advances_func_t.
 *
 * Since: 1.8.6
 * }
procedure hb_font_funcs_set_glyph_v_advances_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_v_advances_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_h_origin_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_h_origin_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_h_origin_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_h_origin_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_v_origin_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_v_origin_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_v_origin_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_v_origin_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_h_kerning_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_h_kerning_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_h_kerning_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_h_kerning_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_extents_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_extents_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_extents_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_extents_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_contour_point_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_contour_point_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_contour_point_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_contour_point_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_name_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_name_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_name_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_name_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_glyph_from_name_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_from_name_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_font_funcs_set_glyph_from_name_func(ffuncs:Phb_font_funcs_t; func:Thb_font_get_glyph_from_name_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_draw_glyph_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_draw_glyph_func_t.
 *
 * Since: 7.0.0
 * }
procedure hb_font_funcs_set_draw_glyph_func(ffuncs:Phb_font_funcs_t; func:Thb_font_draw_glyph_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_font_funcs_set_paint_glyph_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is no longer needed
 *
 * Sets the implementation function for #hb_font_paint_glyph_func_t.
 *
 * Since: 7.0.0
  }
procedure hb_font_funcs_set_paint_glyph_func(ffuncs:Phb_font_funcs_t; func:Thb_font_paint_glyph_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{ func dispatch  }
function hb_font_get_h_extents(font:Phb_font_t; extents:Phb_font_extents_t):Thb_bool_t;cdecl;external;
function hb_font_get_v_extents(font:Phb_font_t; extents:Phb_font_extents_t):Thb_bool_t;cdecl;external;
function hb_font_get_nominal_glyph(font:Phb_font_t; unicode:Thb_codepoint_t; glyph:Phb_codepoint_t):Thb_bool_t;cdecl;external;
function hb_font_get_variation_glyph(font:Phb_font_t; unicode:Thb_codepoint_t; variation_selector:Thb_codepoint_t; glyph:Phb_codepoint_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_font_get_nominal_glyphs(font:Phb_font_t; count:dword; first_unicode:Phb_codepoint_t; unicode_stride:dword; first_glyph:Phb_codepoint_t; 
           glyph_stride:dword):dword;cdecl;external;
function hb_font_get_glyph_h_advance(font:Phb_font_t; glyph:Thb_codepoint_t):Thb_position_t;cdecl;external;
function hb_font_get_glyph_v_advance(font:Phb_font_t; glyph:Thb_codepoint_t):Thb_position_t;cdecl;external;
(* Const before type ignored *)
procedure hb_font_get_glyph_h_advances(font:Phb_font_t; count:dword; first_glyph:Phb_codepoint_t; glyph_stride:dword; first_advance:Phb_position_t; 
            advance_stride:dword);cdecl;external;
(* Const before type ignored *)
procedure hb_font_get_glyph_v_advances(font:Phb_font_t; count:dword; first_glyph:Phb_codepoint_t; glyph_stride:dword; first_advance:Phb_position_t; 
            advance_stride:dword);cdecl;external;
function hb_font_get_glyph_h_origin(font:Phb_font_t; glyph:Thb_codepoint_t; x:Phb_position_t; y:Phb_position_t):Thb_bool_t;cdecl;external;
function hb_font_get_glyph_v_origin(font:Phb_font_t; glyph:Thb_codepoint_t; x:Phb_position_t; y:Phb_position_t):Thb_bool_t;cdecl;external;
function hb_font_get_glyph_h_kerning(font:Phb_font_t; left_glyph:Thb_codepoint_t; right_glyph:Thb_codepoint_t):Thb_position_t;cdecl;external;
function hb_font_get_glyph_extents(font:Phb_font_t; glyph:Thb_codepoint_t; extents:Phb_glyph_extents_t):Thb_bool_t;cdecl;external;
function hb_font_get_glyph_contour_point(font:Phb_font_t; glyph:Thb_codepoint_t; point_index:dword; x:Phb_position_t; y:Phb_position_t):Thb_bool_t;cdecl;external;
function hb_font_get_glyph_name(font:Phb_font_t; glyph:Thb_codepoint_t; name:Pchar; size:dword):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
{ -1 means nul-terminated  }
function hb_font_get_glyph_from_name(font:Phb_font_t; name:Pchar; len:longint; glyph:Phb_codepoint_t):Thb_bool_t;cdecl;external;
procedure hb_font_draw_glyph(font:Phb_font_t; glyph:Thb_codepoint_t; dfuncs:Phb_draw_funcs_t; draw_data:pointer);cdecl;external;
procedure hb_font_paint_glyph(font:Phb_font_t; glyph:Thb_codepoint_t; pfuncs:Phb_paint_funcs_t; paint_data:pointer; palette_index:dword; 
            foreground:Thb_color_t);cdecl;external;
{ high-level funcs, with fallback  }
{ Calls either hb_font_get_nominal_glyph() if variation_selector is 0,
 * otherwise calls hb_font_get_variation_glyph().  }
function hb_font_get_glyph(font:Phb_font_t; unicode:Thb_codepoint_t; variation_selector:Thb_codepoint_t; glyph:Phb_codepoint_t):Thb_bool_t;cdecl;external;
procedure hb_font_get_extents_for_direction(font:Phb_font_t; direction:Thb_direction_t; extents:Phb_font_extents_t);cdecl;external;
procedure hb_font_get_glyph_advance_for_direction(font:Phb_font_t; glyph:Thb_codepoint_t; direction:Thb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;external;
(* Const before type ignored *)
procedure hb_font_get_glyph_advances_for_direction(font:Phb_font_t; direction:Thb_direction_t; count:dword; first_glyph:Phb_codepoint_t; glyph_stride:dword; 
            first_advance:Phb_position_t; advance_stride:dword);cdecl;external;
procedure hb_font_get_glyph_origin_for_direction(font:Phb_font_t; glyph:Thb_codepoint_t; direction:Thb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;external;
procedure hb_font_add_glyph_origin_for_direction(font:Phb_font_t; glyph:Thb_codepoint_t; direction:Thb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;external;
procedure hb_font_subtract_glyph_origin_for_direction(font:Phb_font_t; glyph:Thb_codepoint_t; direction:Thb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;external;
procedure hb_font_get_glyph_kerning_for_direction(font:Phb_font_t; first_glyph:Thb_codepoint_t; second_glyph:Thb_codepoint_t; direction:Thb_direction_t; x:Phb_position_t; 
            y:Phb_position_t);cdecl;external;
function hb_font_get_glyph_extents_for_origin(font:Phb_font_t; glyph:Thb_codepoint_t; direction:Thb_direction_t; extents:Phb_glyph_extents_t):Thb_bool_t;cdecl;external;
function hb_font_get_glyph_contour_point_for_origin(font:Phb_font_t; glyph:Thb_codepoint_t; point_index:dword; direction:Thb_direction_t; x:Phb_position_t; 
           y:Phb_position_t):Thb_bool_t;cdecl;external;
{ Generates gidDDD if glyph has no name.  }
procedure hb_font_glyph_to_string(font:Phb_font_t; glyph:Thb_codepoint_t; s:Pchar; size:dword);cdecl;external;
{ Parses gidDDD and uniUUUU strings automatically.  }
(* Const before type ignored *)
{ -1 means nul-terminated  }
function hb_font_glyph_from_string(font:Phb_font_t; s:Pchar; len:longint; glyph:Phb_codepoint_t):Thb_bool_t;cdecl;external;
{
 * hb_font_t
  }
{ Fonts are very light-weight objects  }
function hb_font_create(face:Phb_face_t):Phb_font_t;cdecl;external;
function hb_font_create_sub_font(parent:Phb_font_t):Phb_font_t;cdecl;external;
function hb_font_get_empty:Phb_font_t;cdecl;external;
function hb_font_reference(font:Phb_font_t):Phb_font_t;cdecl;external;
procedure hb_font_destroy(font:Phb_font_t);cdecl;external;
function hb_font_set_user_data(font:Phb_font_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_font_get_user_data(font:Phb_font_t; key:Phb_user_data_key_t):pointer;cdecl;external;
procedure hb_font_make_immutable(font:Phb_font_t);cdecl;external;
function hb_font_is_immutable(font:Phb_font_t):Thb_bool_t;cdecl;external;
function hb_font_get_serial(font:Phb_font_t):dword;cdecl;external;
procedure hb_font_changed(font:Phb_font_t);cdecl;external;
procedure hb_font_set_parent(font:Phb_font_t; parent:Phb_font_t);cdecl;external;
function hb_font_get_parent(font:Phb_font_t):Phb_font_t;cdecl;external;
procedure hb_font_set_face(font:Phb_font_t; face:Phb_face_t);cdecl;external;
function hb_font_get_face(font:Phb_font_t):Phb_face_t;cdecl;external;
procedure hb_font_set_funcs(font:Phb_font_t; klass:Phb_font_funcs_t; font_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{ Be *very* careful with this function!  }
procedure hb_font_set_funcs_data(font:Phb_font_t; font_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
procedure hb_font_set_scale(font:Phb_font_t; x_scale:longint; y_scale:longint);cdecl;external;
procedure hb_font_get_scale(font:Phb_font_t; x_scale:Plongint; y_scale:Plongint);cdecl;external;
{
 * A zero value means "no hinting in that direction"
  }
procedure hb_font_set_ppem(font:Phb_font_t; x_ppem:dword; y_ppem:dword);cdecl;external;
procedure hb_font_get_ppem(font:Phb_font_t; x_ppem:Pdword; y_ppem:Pdword);cdecl;external;
{
 * Point size per EM.  Used for optical-sizing in CoreText.
 * A value of zero means "not set".
  }
procedure hb_font_set_ptem(font:Phb_font_t; ptem:single);cdecl;external;
function hb_font_get_ptem(font:Phb_font_t):single;cdecl;external;
procedure hb_font_set_synthetic_bold(font:Phb_font_t; x_embolden:single; y_embolden:single; in_place:Thb_bool_t);cdecl;external;
procedure hb_font_get_synthetic_bold(font:Phb_font_t; x_embolden:Psingle; y_embolden:Psingle; in_place:Phb_bool_t);cdecl;external;
procedure hb_font_set_synthetic_slant(font:Phb_font_t; slant:single);cdecl;external;
function hb_font_get_synthetic_slant(font:Phb_font_t):single;cdecl;external;
(* Const before type ignored *)
procedure hb_font_set_variations(font:Phb_font_t; variations:Phb_variation_t; variations_length:dword);cdecl;external;
procedure hb_font_set_variation(font:Phb_font_t; tag:Thb_tag_t; value:single);cdecl;external;
(* Const before type ignored *)
procedure hb_font_set_var_coords_design(font:Phb_font_t; coords:Psingle; coords_length:dword);cdecl;external;
(* Const before type ignored *)
function hb_font_get_var_coords_design(font:Phb_font_t; length:Pdword):Psingle;cdecl;external;
(* Const before type ignored *)
{ 2.14 normalized  }
procedure hb_font_set_var_coords_normalized(font:Phb_font_t; coords:Plongint; coords_length:dword);cdecl;external;
(* Const before type ignored *)
function hb_font_get_var_coords_normalized(font:Phb_font_t; length:Pdword):Plongint;cdecl;external;
{*
 * HB_FONT_NO_VAR_NAMED_INSTANCE:
 *
 * Constant signifying that a font does not have any
 * named-instance index set.  This is the default of
 * a font.
 *
 * Since: 7.0.0
  }
const
  HB_FONT_NO_VAR_NAMED_INSTANCE = $FFFFFFFF;  

procedure hb_font_set_var_named_instance(font:Phb_font_t; instance_index:dword);cdecl;external;
function hb_font_get_var_named_instance(font:Phb_font_t):dword;cdecl;external;
{$endif}
{ HB_FONT_H  }

implementation


end.
