unit pango_font_3;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-font.h: Font handling
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
{$ifndef __PANGO_FONT_H__}
{$define __PANGO_FONT_H__}
{$include <pango/pango-coverage.h>}
{$include <pango/pango-types.h>}
{$include <glib-object.h>}
{$include <hb.h>}
{*
 * PangoFontDescription:
 *
 * A `PangoFontDescription` describes a font in an implementation-independent
 * manner.
 *
 * `PangoFontDescription` structures are used both to list what fonts are
 * available on the system and also for specifying the characteristics of
 * a font to load.
  }
type
{*
 * PangoFontMetrics:
 *
 * A `PangoFontMetrics` structure holds the overall metric information
 * for a font.
 *
 * The information in a `PangoFontMetrics` structure may be restricted
 * to a script. The fields of this structure are private to implementations
 * of a font backend. See the documentation of the corresponding getters
 * for documentation of their meaning.
 *
 * For an overview of the most important metrics, see:
 *
 * <picture>
 *   <source srcset="fontmetrics-dark.png" media="(prefers-color-scheme: dark)">
 *   <img alt="Font metrics" src="fontmetrics-light.png">
 * </picture>

  }
{*
 * PangoStyle:
 * @PANGO_STYLE_NORMAL: the font is upright.
 * @PANGO_STYLE_OBLIQUE: the font is slanted, but in a roman style.
 * @PANGO_STYLE_ITALIC: the font is slanted in an italic style.
 *
 * An enumeration specifying the various slant styles possible for a font.
 * }

  PPangoStyle = ^TPangoStyle;
  TPangoStyle =  Longint;
  Const
    PANGO_STYLE_NORMAL = 0;
    PANGO_STYLE_OBLIQUE = 1;
    PANGO_STYLE_ITALIC = 2;
;
{*
 * PangoVariant:
 * @PANGO_VARIANT_NORMAL: A normal font.
 * @PANGO_VARIANT_SMALL_CAPS: A font with the lower case characters
 *   replaced by smaller variants of the capital characters.
 * @PANGO_VARIANT_ALL_SMALL_CAPS: A font with all characters
 *   replaced by smaller variants of the capital characters. Since: 1.50
 * @PANGO_VARIANT_PETITE_CAPS: A font with the lower case characters
 *   replaced by smaller variants of the capital characters.
 *   Petite Caps can be even smaller than Small Caps. Since: 1.50
 * @PANGO_VARIANT_ALL_PETITE_CAPS: A font with all characters
 *   replaced by smaller variants of the capital characters.
 *   Petite Caps can be even smaller than Small Caps. Since: 1.50
 * @PANGO_VARIANT_UNICASE: A font with the upper case characters
 *   replaced by smaller variants of the capital letters. Since: 1.50
 * @PANGO_VARIANT_TITLE_CAPS: A font with capital letters that
 *   are more suitable for all-uppercase titles. Since: 1.50
 *
 * An enumeration specifying capitalization variant of the font.
  }
type
  PPangoVariant = ^TPangoVariant;
  TPangoVariant =  Longint;
  Const
    PANGO_VARIANT_NORMAL = 0;
    PANGO_VARIANT_SMALL_CAPS = 1;
    PANGO_VARIANT_ALL_SMALL_CAPS = 2;
    PANGO_VARIANT_PETITE_CAPS = 3;
    PANGO_VARIANT_ALL_PETITE_CAPS = 4;
    PANGO_VARIANT_UNICASE = 5;
    PANGO_VARIANT_TITLE_CAPS = 6;
;
{*
 * PangoWeight:
 * @PANGO_WEIGHT_THIN: the thin weight (= 100) Since: 1.24
 * @PANGO_WEIGHT_ULTRALIGHT: the ultralight weight (= 200)
 * @PANGO_WEIGHT_LIGHT: the light weight (= 300)
 * @PANGO_WEIGHT_SEMILIGHT: the semilight weight (= 350) Since: 1.36.7
 * @PANGO_WEIGHT_BOOK: the book weight (= 380) Since: 1.24)
 * @PANGO_WEIGHT_NORMAL: the default weight (= 400)
 * @PANGO_WEIGHT_MEDIUM: the medium weight (= 500) Since: 1.24
 * @PANGO_WEIGHT_SEMIBOLD: the semibold weight (= 600)
 * @PANGO_WEIGHT_BOLD: the bold weight (= 700)
 * @PANGO_WEIGHT_ULTRABOLD: the ultrabold weight (= 800)
 * @PANGO_WEIGHT_HEAVY: the heavy weight (= 900)
 * @PANGO_WEIGHT_ULTRAHEAVY: the ultraheavy weight (= 1000) Since: 1.24
 *
 * An enumeration specifying the weight (boldness) of a font.
 *
 * Weight is specified as a numeric value ranging from 100 to 1000.
 * This enumeration simply provides some common, predefined values.
  }
type
  PPangoWeight = ^TPangoWeight;
  TPangoWeight =  Longint;
  Const
    PANGO_WEIGHT_THIN = 100;
    PANGO_WEIGHT_ULTRALIGHT = 200;
    PANGO_WEIGHT_LIGHT = 300;
    PANGO_WEIGHT_SEMILIGHT = 350;
    PANGO_WEIGHT_BOOK = 380;
    PANGO_WEIGHT_NORMAL = 400;
    PANGO_WEIGHT_MEDIUM = 500;
    PANGO_WEIGHT_SEMIBOLD = 600;
    PANGO_WEIGHT_BOLD = 700;
    PANGO_WEIGHT_ULTRABOLD = 800;
    PANGO_WEIGHT_HEAVY = 900;
    PANGO_WEIGHT_ULTRAHEAVY = 1000;
;
{*
 * PangoStretch:
 * @PANGO_STRETCH_ULTRA_CONDENSED: ultra condensed width
 * @PANGO_STRETCH_EXTRA_CONDENSED: extra condensed width
 * @PANGO_STRETCH_CONDENSED: condensed width
 * @PANGO_STRETCH_SEMI_CONDENSED: semi condensed width
 * @PANGO_STRETCH_NORMAL: the normal width
 * @PANGO_STRETCH_SEMI_EXPANDED: semi expanded width
 * @PANGO_STRETCH_EXPANDED: expanded width
 * @PANGO_STRETCH_EXTRA_EXPANDED: extra expanded width
 * @PANGO_STRETCH_ULTRA_EXPANDED: ultra expanded width
 *
 * An enumeration specifying the width of the font relative to other designs
 * within a family.
  }
type
  PPangoStretch = ^TPangoStretch;
  TPangoStretch =  Longint;
  Const
    PANGO_STRETCH_ULTRA_CONDENSED = 0;
    PANGO_STRETCH_EXTRA_CONDENSED = 1;
    PANGO_STRETCH_CONDENSED = 2;
    PANGO_STRETCH_SEMI_CONDENSED = 3;
    PANGO_STRETCH_NORMAL = 4;
    PANGO_STRETCH_SEMI_EXPANDED = 5;
    PANGO_STRETCH_EXPANDED = 6;
    PANGO_STRETCH_EXTRA_EXPANDED = 7;
    PANGO_STRETCH_ULTRA_EXPANDED = 8;
;
{*
 * PangoFontMask:
 * @PANGO_FONT_MASK_FAMILY: the font family is specified.
 * @PANGO_FONT_MASK_STYLE: the font style is specified.
 * @PANGO_FONT_MASK_VARIANT: the font variant is specified.
 * @PANGO_FONT_MASK_WEIGHT: the font weight is specified.
 * @PANGO_FONT_MASK_STRETCH: the font stretch is specified.
 * @PANGO_FONT_MASK_SIZE: the font size is specified.
 * @PANGO_FONT_MASK_GRAVITY: the font gravity is specified (Since: 1.16.)
 * @PANGO_FONT_MASK_VARIATIONS: OpenType font variations are specified (Since: 1.42)
 *
 * The bits in a `PangoFontMask` correspond to the set fields in a
 * `PangoFontDescription`.
  }
type
  PPangoFontMask = ^TPangoFontMask;
  TPangoFontMask =  Longint;
  Const
    PANGO_FONT_MASK_FAMILY = 1 shl 0;
    PANGO_FONT_MASK_STYLE = 1 shl 1;
    PANGO_FONT_MASK_VARIANT = 1 shl 2;
    PANGO_FONT_MASK_WEIGHT = 1 shl 3;
    PANGO_FONT_MASK_STRETCH = 1 shl 4;
    PANGO_FONT_MASK_SIZE = 1 shl 5;
    PANGO_FONT_MASK_GRAVITY = 1 shl 6;
    PANGO_FONT_MASK_VARIATIONS = 1 shl 7;
;
{ CSS scale factors (1.2 factor between each size)  }
{*
 * PANGO_SCALE_XX_SMALL:
 *
 * The scale factor for three shrinking steps (1 / (1.2 * 1.2 * 1.2)).
  }
{*
 * PANGO_SCALE_X_SMALL:
 *
 * The scale factor for two shrinking steps (1 / (1.2 * 1.2)).
  }
{*
 * PANGO_SCALE_SMALL:
 *
 * The scale factor for one shrinking step (1 / 1.2).
  }
{*
 * PANGO_SCALE_MEDIUM:
 *
 * The scale factor for normal size (1.0).
  }
{*
 * PANGO_SCALE_LARGE:
 *
 * The scale factor for one magnification step (1.2).
  }
{*
 * PANGO_SCALE_X_LARGE:
 *
 * The scale factor for two magnification steps (1.2 * 1.2).
  }
{*
 * PANGO_SCALE_XX_LARGE:
 *
 * The scale factor for three magnification steps (1.2 * 1.2 * 1.2).
  }
{
 * PangoFontDescription
  }

function pango_font_description_get_type:TGType;cdecl;external libpango;
function pango_font_description_new:PPangoFontDescription;cdecl;external libpango;
function pango_font_description_copy(desc:PPangoFontDescription):PPangoFontDescription;cdecl;external libpango;
function pango_font_description_copy_static(desc:PPangoFontDescription):PPangoFontDescription;cdecl;external libpango;
function pango_font_description_hash(desc:PPangoFontDescription):Tguint;cdecl;external libpango;
function pango_font_description_equal(desc1:PPangoFontDescription; desc2:PPangoFontDescription):Tgboolean;cdecl;external libpango;
procedure pango_font_description_free(desc:PPangoFontDescription);cdecl;external libpango;
procedure pango_font_descriptions_free(descs:PPPangoFontDescription; n_descs:longint);cdecl;external libpango;
procedure pango_font_description_set_family(desc:PPangoFontDescription; family:Pchar);cdecl;external libpango;
procedure pango_font_description_set_family_static(desc:PPangoFontDescription; family:Pchar);cdecl;external libpango;
function pango_font_description_get_family(desc:PPangoFontDescription):Pchar;cdecl;external libpango;
procedure pango_font_description_set_style(desc:PPangoFontDescription; style:TPangoStyle);cdecl;external libpango;
function pango_font_description_get_style(desc:PPangoFontDescription):TPangoStyle;cdecl;external libpango;
procedure pango_font_description_set_variant(desc:PPangoFontDescription; variant:TPangoVariant);cdecl;external libpango;
function pango_font_description_get_variant(desc:PPangoFontDescription):TPangoVariant;cdecl;external libpango;
procedure pango_font_description_set_weight(desc:PPangoFontDescription; weight:TPangoWeight);cdecl;external libpango;
function pango_font_description_get_weight(desc:PPangoFontDescription):TPangoWeight;cdecl;external libpango;
procedure pango_font_description_set_stretch(desc:PPangoFontDescription; stretch:TPangoStretch);cdecl;external libpango;
function pango_font_description_get_stretch(desc:PPangoFontDescription):TPangoStretch;cdecl;external libpango;
procedure pango_font_description_set_size(desc:PPangoFontDescription; size:Tgint);cdecl;external libpango;
function pango_font_description_get_size(desc:PPangoFontDescription):Tgint;cdecl;external libpango;
procedure pango_font_description_set_absolute_size(desc:PPangoFontDescription; size:Tdouble);cdecl;external libpango;
function pango_font_description_get_size_is_absolute(desc:PPangoFontDescription):Tgboolean;cdecl;external libpango;
procedure pango_font_description_set_gravity(desc:PPangoFontDescription; gravity:TPangoGravity);cdecl;external libpango;
function pango_font_description_get_gravity(desc:PPangoFontDescription):TPangoGravity;cdecl;external libpango;
procedure pango_font_description_set_variations_static(desc:PPangoFontDescription; variations:Pchar);cdecl;external libpango;
procedure pango_font_description_set_variations(desc:PPangoFontDescription; variations:Pchar);cdecl;external libpango;
function pango_font_description_get_variations(desc:PPangoFontDescription):Pchar;cdecl;external libpango;
function pango_font_description_get_set_fields(desc:PPangoFontDescription):TPangoFontMask;cdecl;external libpango;
procedure pango_font_description_unset_fields(desc:PPangoFontDescription; to_unset:TPangoFontMask);cdecl;external libpango;
procedure pango_font_description_merge(desc:PPangoFontDescription; desc_to_merge:PPangoFontDescription; replace_existing:Tgboolean);cdecl;external libpango;
procedure pango_font_description_merge_static(desc:PPangoFontDescription; desc_to_merge:PPangoFontDescription; replace_existing:Tgboolean);cdecl;external libpango;
function pango_font_description_better_match(desc:PPangoFontDescription; old_match:PPangoFontDescription; new_match:PPangoFontDescription):Tgboolean;cdecl;external libpango;
function pango_font_description_from_string(str:Pchar):PPangoFontDescription;cdecl;external libpango;
function pango_font_description_to_string(desc:PPangoFontDescription):Pchar;cdecl;external libpango;
function pango_font_description_to_filename(desc:PPangoFontDescription):Pchar;cdecl;external libpango;
{
 * PangoFontMetrics
  }
{ <private>  }
type
  PPangoFontMetrics = ^TPangoFontMetrics;
  TPangoFontMetrics = record
      ref_count : Tguint;
      ascent : longint;
      descent : longint;
      height : longint;
      approximate_char_width : longint;
      approximate_digit_width : longint;
      underline_position : longint;
      underline_thickness : longint;
      strikethrough_position : longint;
      strikethrough_thickness : longint;
    end;


function pango_font_metrics_get_type:TGType;cdecl;external libpango;
function pango_font_metrics_ref(metrics:PPangoFontMetrics):PPangoFontMetrics;cdecl;external libpango;
procedure pango_font_metrics_unref(metrics:PPangoFontMetrics);cdecl;external libpango;
function pango_font_metrics_get_ascent(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_descent(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_height(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_approximate_char_width(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_approximate_digit_width(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_underline_position(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_underline_thickness(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_strikethrough_position(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
function pango_font_metrics_get_strikethrough_thickness(metrics:PPangoFontMetrics):longint;cdecl;external libpango;
{
 * PangoFontFamily
  }
type
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PangoFontFamily:
 *
 * A `PangoFontFamily` is used to represent a family of related
 * font faces.
 *
 * The font faces in a family share a common design, but differ in
 * slant, weight, width or other aspects.
  }
type
  PPangoFontFamily = ^TPangoFontFamily;
  TPangoFontFamily = record
      parent_instance : TGObject;
    end;

{< public > }
{< private > }
{ Padding for future expansion  }
  PPangoFontFamilyClass = ^TPangoFontFamilyClass;
  TPangoFontFamilyClass = record
      parent_class : TGObjectClass;
      list_faces : procedure (family:PPangoFontFamily; faces:PPPPangoFontFace; n_faces:Plongint);cdecl;
      get_name : function (family:PPangoFontFamily):Pchar;cdecl;
      is_monospace : function (family:PPangoFontFamily):Tgboolean;cdecl;
      is_variable : function (family:PPangoFontFamily):Tgboolean;cdecl;
      get_face : function (family:PPangoFontFamily; name:Pchar):PPangoFontFace;cdecl;
      _pango_reserved2 : procedure ;cdecl;
    end;

{$endif}
{ PANGO_DISABLE_DEPRECATED  }

function pango_font_family_get_type:TGType;cdecl;external libpango;
procedure pango_font_family_list_faces(family:PPangoFontFamily; faces:PPPPangoFontFace; n_faces:Plongint);cdecl;external libpango;
function pango_font_family_get_name(family:PPangoFontFamily):Pchar;cdecl;external libpango;
function pango_font_family_is_monospace(family:PPangoFontFamily):Tgboolean;cdecl;external libpango;
function pango_font_family_is_variable(family:PPangoFontFamily):Tgboolean;cdecl;external libpango;
function pango_font_family_get_face(family:PPangoFontFamily; name:Pchar):PPangoFontFace;cdecl;external libpango;
{
 * PangoFontFace
  }
type
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PangoFontFace:
 *
 * A `PangoFontFace` is used to represent a group of fonts with
 * the same family, slant, weight, and width, but varying sizes.
  }
type
  PPangoFontFace = ^TPangoFontFace;
  TPangoFontFace = record
      parent_instance : TGObject;
    end;

{< public > }
{< private > }
{ Padding for future expansion  }
  PPangoFontFaceClass = ^TPangoFontFaceClass;
  TPangoFontFaceClass = record
      parent_class : TGObjectClass;
      get_face_name : function (face:PPangoFontFace):Pchar;cdecl;
      describe : function (face:PPangoFontFace):PPangoFontDescription;cdecl;
      list_sizes : procedure (face:PPangoFontFace; sizes:PPlongint; n_sizes:Plongint);cdecl;
      is_synthesized : function (face:PPangoFontFace):Tgboolean;cdecl;
      get_family : function (face:PPangoFontFace):PPangoFontFamily;cdecl;
      _pango_reserved3 : procedure ;cdecl;
      _pango_reserved4 : procedure ;cdecl;
    end;

{$endif}
{ PANGO_DISABLE_DEPRECATED  }

function pango_font_face_get_type:TGType;cdecl;external libpango;
function pango_font_face_describe(face:PPangoFontFace):PPangoFontDescription;cdecl;external libpango;
function pango_font_face_get_face_name(face:PPangoFontFace):Pchar;cdecl;external libpango;
procedure pango_font_face_list_sizes(face:PPangoFontFace; sizes:PPlongint; n_sizes:Plongint);cdecl;external libpango;
function pango_font_face_is_synthesized(face:PPangoFontFace):Tgboolean;cdecl;external libpango;
function pango_font_face_get_family(face:PPangoFontFace):PPangoFontFamily;cdecl;external libpango;
{
 * PangoFont
  }
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PangoFont:
 *
 * A `PangoFont` is used to represent a font in a
 * rendering-system-independent manner.
  }
type
  PPangoFont = ^TPangoFont;
  TPangoFont = record
      parent_instance : TGObject;
    end;

{< public > }
  PPangoFontClass = ^TPangoFontClass;
  TPangoFontClass = record
      parent_class : TGObjectClass;
      describe : function (font:PPangoFont):PPangoFontDescription;cdecl;
      get_coverage : function (font:PPangoFont; language:PPangoLanguage):PPangoCoverage;cdecl;
      get_glyph_extents : procedure (font:PPangoFont; glyph:TPangoGlyph; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;
      get_metrics : function (font:PPangoFont; language:PPangoLanguage):PPangoFontMetrics;cdecl;
      get_font_map : function (font:PPangoFont):PPangoFontMap;cdecl;
      describe_absolute : function (font:PPangoFont):PPangoFontDescription;cdecl;
      get_features : procedure (font:PPangoFont; features:Phb_feature_t; len:Tguint; num_features:Pguint);cdecl;
      create_hb_font : function (font:PPangoFont):Phb_font_t;cdecl;
    end;

{$endif}
{ PANGO_DISABLE_DEPRECATED  }

function pango_font_get_type:TGType;cdecl;external libpango;
function pango_font_describe(font:PPangoFont):PPangoFontDescription;cdecl;external libpango;
function pango_font_describe_with_absolute_size(font:PPangoFont):PPangoFontDescription;cdecl;external libpango;
function pango_font_get_coverage(font:PPangoFont; language:PPangoLanguage):PPangoCoverage;cdecl;external libpango;
{$ifndef __GI_SCANNER__}

function pango_font_find_shaper(font:PPangoFont; language:PPangoLanguage; ch:Tguint32):PPangoEngineShape;cdecl;external libpango;
{$endif}

function pango_font_get_metrics(font:PPangoFont; language:PPangoLanguage):PPangoFontMetrics;cdecl;external libpango;
procedure pango_font_get_glyph_extents(font:PPangoFont; glyph:TPangoGlyph; ink_rect:PPangoRectangle; logical_rect:PPangoRectangle);cdecl;external libpango;
function pango_font_get_font_map(font:PPangoFont):PPangoFontMap;cdecl;external libpango;
function pango_font_get_face(font:PPangoFont):PPangoFontFace;cdecl;external libpango;
function pango_font_has_char(font:PPangoFont; wc:Tgunichar):Tgboolean;cdecl;external libpango;
procedure pango_font_get_features(font:PPangoFont; features:Phb_feature_t; len:Tguint; num_features:Pguint);cdecl;external libpango;
function pango_font_get_hb_font(font:PPangoFont):Phb_font_t;cdecl;external libpango;
function pango_font_get_languages(font:PPangoFont):^PPangoLanguage;cdecl;external libpango;
function pango_font_serialize(font:PPangoFont):PGBytes;cdecl;external libpango;
function pango_font_deserialize(context:PPangoContext; bytes:PGBytes; error:PPGError):PPangoFont;cdecl;external libpango;
{ was #define dname def_expr }
function PANGO_TYPE_FONT_DESCRIPTION : longint; { return type might be wrong }

{ was #define dname def_expr }
function PANGO_TYPE_FONT_METRICS : longint; { return type might be wrong }

{*
 * PANGO_GLYPH_EMPTY:
 *
 * A `PangoGlyph` value that indicates a zero-width empty glpyh.
 *
 * This is useful for example in shaper modules, to use as the glyph for
 * various zero-width Unicode characters (those passing [func@is_zero_width]).
  }
{*
 * PANGO_GLYPH_INVALID_INPUT:
 *
 * A `PangoGlyph` value for invalid input.
 *
 * `PangoLayout` produces one such glyph per invalid input UTF-8 byte and such
 * a glyph is rendered as a crossed box.
 *
 * Note that this value is defined such that it has the %PANGO_GLYPH_UNKNOWN_FLAG
 * set.
 *
 * Since: 1.20
  }
{*
 * PANGO_GLYPH_UNKNOWN_FLAG:
 *
 * Flag used in `PangoGlyph` to turn a `gunichar` value of a valid Unicode
 * character into an unknown-character glyph for that `gunichar`.
 *
 * Such unknown-character glyphs may be rendered as a 'hex box'.
  }
{*
 * PANGO_GET_UNKNOWN_GLYPH:
 * @wc: a Unicode character
 *
 * The way this unknown glyphs are rendered is backend specific. For example,
 * a box with the hexadecimal Unicode code-point of the character written in it
 * is what is done in the most common backends.
 *
 * Returns: a `PangoGlyph` value that means no glyph was found for @wc.
  }
{ was #define dname def_expr }
function PANGO_GLYPH_EMPTY : TPangoGlyph;  

{ was #define dname def_expr }
function PANGO_GLYPH_INVALID_INPUT : TPangoGlyph;  

{ was #define dname def_expr }
function PANGO_GLYPH_UNKNOWN_FLAG : TPangoGlyph;  

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_GET_UNKNOWN_GLYPH(wc : longint) : longint;

{$ifndef __GI_SCANNER__}
{$ifndef PANGO_DISABLE_DEPRECATED}

const
  PANGO_UNKNOWN_GLYPH_WIDTH = 10;  
  PANGO_UNKNOWN_GLYPH_HEIGHT = 14;  
{$endif}
{$endif}
{$endif}
{ __PANGO_FONT_H__  }

// === Konventiert am: 23-11-24 17:45:27 ===

function PANGO_TYPE_FONT : TGType;
function PANGO_FONT(obj : Pointer) : PPangoFont;
function PANGO_FONT_CLASS(klass : Pointer) : PPangoFontClass;
function PANGO_IS_FONT(obj : Pointer) : Tgboolean;
function PANGO_IS_FONT_CLASS(klass : Pointer) : Tgboolean;
function PANGO_FONT_GET_CLASS(obj : Pointer) : PPangoFontClass;

implementation

function PANGO_TYPE_FONT : TGType;
  begin
    PANGO_TYPE_FONT:=pango_font_get_type;
  end;

function PANGO_FONT(obj : Pointer) : PPangoFont;
begin
  Result := PPangoFont(g_type_check_instance_cast(obj, PANGO_TYPE_FONT));
end;

function PANGO_FONT_CLASS(klass : Pointer) : PPangoFontClass;
begin
  Result := PPangoFontClass(g_type_check_class_cast(klass, PANGO_TYPE_FONT));
end;

function PANGO_IS_FONT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_FONT);
end;

function PANGO_IS_FONT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PANGO_TYPE_FONT);
end;

function PANGO_FONT_GET_CLASS(obj : Pointer) : PPangoFontClass;
begin
  Result := PPangoFontClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function PANGO_TYPE_FONT_DESCRIPTION : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FONT_DESCRIPTION:=pango_font_description_get_type;
  end;

{ was #define dname def_expr }
function PANGO_TYPE_FONT_METRICS : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FONT_METRICS:=pango_font_metrics_get_type;
  end;

{ was #define dname def_expr }
function PANGO_GLYPH_EMPTY : TPangoGlyph;
  begin
    PANGO_GLYPH_EMPTY:=TPangoGlyph($0FFFFFFF);
  end;

{ was #define dname def_expr }
function PANGO_GLYPH_INVALID_INPUT : TPangoGlyph;
  begin
    PANGO_GLYPH_INVALID_INPUT:=TPangoGlyph($FFFFFFFF);
  end;

{ was #define dname def_expr }
function PANGO_GLYPH_UNKNOWN_FLAG : TPangoGlyph;
  begin
    PANGO_GLYPH_UNKNOWN_FLAG:=TPangoGlyph($10000000);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_GET_UNKNOWN_GLYPH(wc : longint) : longint;
begin
  PANGO_GET_UNKNOWN_GLYPH:=(TPangoGlyph(wc)) or PANGO_GLYPH_UNKNOWN_FLAG;
end;


end.
