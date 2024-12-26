
unit hb_ot_layout;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ot_layout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ot_layout.h
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
Phb_codepoint_t  = ^hb_codepoint_t;
Phb_face_t  = ^hb_face_t;
Phb_font_extents_t  = ^hb_font_extents_t;
Phb_font_t  = ^hb_font_t;
Phb_language_t  = ^hb_language_t;
Phb_map_t  = ^hb_map_t;
Phb_ot_layout_baseline_tag_t  = ^hb_ot_layout_baseline_tag_t;
Phb_ot_layout_glyph_class_t  = ^hb_ot_layout_glyph_class_t;
Phb_ot_name_id_t  = ^hb_ot_name_id_t;
Phb_position_t  = ^hb_position_t;
Phb_script_t  = ^hb_script_t;
Phb_set_t  = ^hb_set_t;
Phb_tag_t  = ^hb_tag_t;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2007,2008,2009  Red Hat, Inc.
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
{$if !defined(HB_OT_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb-ot.h> instead."}
{$endif}
{$ifndef HB_OT_LAYOUT_H}
{$define HB_OT_LAYOUT_H}
{$include "hb.h"}
{$include "hb-ot-name.h"}
{*
 * HB_OT_TAG_BASE:
 *
 * OpenType [Baseline Table](https://docs.microsoft.com/en-us/typography/opentype/spec/base).
  }

{ was #define dname def_expr }
function HB_OT_TAG_BASE : longint; { return type might be wrong }

{*
 * HB_OT_TAG_GDEF:
 *
 * OpenType [Glyph Definition Table](https://docs.microsoft.com/en-us/typography/opentype/spec/gdef).
  }
{ was #define dname def_expr }
function HB_OT_TAG_GDEF : longint; { return type might be wrong }

{*
 * HB_OT_TAG_GSUB:
 *
 * OpenType [Glyph Substitution Table](https://docs.microsoft.com/en-us/typography/opentype/spec/gsub).
  }
{ was #define dname def_expr }
function HB_OT_TAG_GSUB : longint; { return type might be wrong }

{*
 * HB_OT_TAG_GPOS:
 *
 * OpenType [Glyph Positioning Table](https://docs.microsoft.com/en-us/typography/opentype/spec/gpos).
  }
{ was #define dname def_expr }
function HB_OT_TAG_GPOS : longint; { return type might be wrong }

{*
 * HB_OT_TAG_JSTF:
 *
 * OpenType [Justification Table](https://docs.microsoft.com/en-us/typography/opentype/spec/jstf).
  }
{ was #define dname def_expr }
function HB_OT_TAG_JSTF : longint; { return type might be wrong }

{
 * Script & Language tags.
  }
{*
 * HB_OT_TAG_DEFAULT_SCRIPT:
 *
 * OpenType script tag, `DFLT`, for features that are not script-specific.
 *
  }
{ was #define dname def_expr }
function HB_OT_TAG_DEFAULT_SCRIPT : longint; { return type might be wrong }

{*
 * HB_OT_TAG_DEFAULT_LANGUAGE:
 *
 * OpenType language tag, `dflt`. Not a valid language tag, but some fonts
 * mistakenly use it.
  }
{ was #define dname def_expr }
function HB_OT_TAG_DEFAULT_LANGUAGE : longint; { return type might be wrong }

{*
 * HB_OT_MAX_TAGS_PER_SCRIPT:
 *
 * Maximum number of OpenType tags that can correspond to a give #hb_script_t.
 *
 * Since: 2.0.0
 * }
const
  HB_OT_MAX_TAGS_PER_SCRIPT = 3;  
{*
 * HB_OT_MAX_TAGS_PER_LANGUAGE:
 *
 * Maximum number of OpenType tags that can correspond to a give #hb_language_t.
 *
 * Since: 2.0.0
 * }
  HB_OT_MAX_TAGS_PER_LANGUAGE = 3;  
{ IN/OUT  }{ OUT  }{ IN/OUT  }{ OUT  }
procedure hb_ot_tags_from_script_and_language(script:Thb_script_t; language:Thb_language_t; script_count:Pdword; script_tags:Phb_tag_t; language_count:Pdword; 
            language_tags:Phb_tag_t);cdecl;external;
function hb_ot_tag_to_script(tag:Thb_tag_t):Thb_script_t;cdecl;external;
function hb_ot_tag_to_language(tag:Thb_tag_t):Thb_language_t;cdecl;external;
{ OUT  }{ OUT  }procedure hb_ot_tags_to_script_and_language(script_tag:Thb_tag_t; language_tag:Thb_tag_t; script:Phb_script_t; language:Phb_language_t);cdecl;external;
{
 * GDEF
  }
function hb_ot_layout_has_glyph_classes(face:Phb_face_t):Thb_bool_t;cdecl;external;
{*
 * hb_ot_layout_glyph_class_t:
 * @HB_OT_LAYOUT_GLYPH_CLASS_UNCLASSIFIED: Glyphs not matching the other classifications
 * @HB_OT_LAYOUT_GLYPH_CLASS_BASE_GLYPH: Spacing, single characters, capable of accepting marks
 * @HB_OT_LAYOUT_GLYPH_CLASS_LIGATURE: Glyphs that represent ligation of multiple characters
 * @HB_OT_LAYOUT_GLYPH_CLASS_MARK: Non-spacing, combining glyphs that represent marks
 * @HB_OT_LAYOUT_GLYPH_CLASS_COMPONENT: Spacing glyphs that represent part of a single character
 *
 * The GDEF classes defined for glyphs.
 *
 * }
type
  Phb_ot_layout_glyph_class_t = ^Thb_ot_layout_glyph_class_t;
  Thb_ot_layout_glyph_class_t =  Longint;
  Const
    HB_OT_LAYOUT_GLYPH_CLASS_UNCLASSIFIED = 0;
    HB_OT_LAYOUT_GLYPH_CLASS_BASE_GLYPH = 1;
    HB_OT_LAYOUT_GLYPH_CLASS_LIGATURE = 2;
    HB_OT_LAYOUT_GLYPH_CLASS_MARK = 3;
    HB_OT_LAYOUT_GLYPH_CLASS_COMPONENT = 4;
;

function hb_ot_layout_get_glyph_class(face:Phb_face_t; glyph:Thb_codepoint_t):Thb_ot_layout_glyph_class_t;cdecl;external;
{ OUT  }procedure hb_ot_layout_get_glyphs_in_class(face:Phb_face_t; klass:Thb_ot_layout_glyph_class_t; glyphs:Phb_set_t);cdecl;external;
{ Not that useful.  Provides list of attach points for a glyph that a
 * client may want to cache  }
{ IN/OUT  }{ OUT  }function hb_ot_layout_get_attach_points(face:Phb_face_t; glyph:Thb_codepoint_t; start_offset:dword; point_count:Pdword; point_array:Pdword):dword;cdecl;external;
{ Ligature caret positions  }
{ IN/OUT  }{ OUT  }function hb_ot_layout_get_ligature_carets(font:Phb_font_t; direction:Thb_direction_t; glyph:Thb_codepoint_t; start_offset:dword; caret_count:Pdword; 
           caret_array:Phb_position_t):dword;cdecl;external;
{
 * GSUB/GPOS feature query and enumeration interface
  }
{*
 * HB_OT_LAYOUT_NO_SCRIPT_INDEX:
 *
 * Special value for script index indicating unsupported script.
  }
const
  HB_OT_LAYOUT_NO_SCRIPT_INDEX = $FFFF;  
{*
 * HB_OT_LAYOUT_NO_FEATURE_INDEX:
 *
 * Special value for feature index indicating unsupported feature.
  }
  HB_OT_LAYOUT_NO_FEATURE_INDEX = $FFFF;  
{*
 * HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX:
 *
 * Special value for language index indicating default or unsupported language.
  }
  HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = $FFFF;  
{*
 * HB_OT_LAYOUT_NO_VARIATIONS_INDEX:
 *
 * Special value for variations index indicating unsupported variation.
  }
  HB_OT_LAYOUT_NO_VARIATIONS_INDEX = $FFFFFFFF;  
{ IN/OUT  }{ OUT  }
function hb_ot_layout_table_get_script_tags(face:Phb_face_t; table_tag:Thb_tag_t; start_offset:dword; script_count:Pdword; script_tags:Phb_tag_t):dword;cdecl;external;
{ OUT  }function hb_ot_layout_table_find_script(face:Phb_face_t; table_tag:Thb_tag_t; script_tag:Thb_tag_t; script_index:Pdword):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
{ OUT  }{ OUT  }function hb_ot_layout_table_select_script(face:Phb_face_t; table_tag:Thb_tag_t; script_count:dword; script_tags:Phb_tag_t; script_index:Pdword; 
           chosen_script:Phb_tag_t):Thb_bool_t;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_table_get_feature_tags(face:Phb_face_t; table_tag:Thb_tag_t; start_offset:dword; feature_count:Pdword; feature_tags:Phb_tag_t):dword;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_script_get_language_tags(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; start_offset:dword; language_count:Pdword; 
           language_tags:Phb_tag_t):dword;cdecl;external;
(* Const before type ignored *)
{ OUT  }function hb_ot_layout_script_select_language(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_count:dword; language_tags:Phb_tag_t; 
           language_index:Pdword):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
{ OUT  }{ OUT  }function hb_ot_layout_script_select_language2(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_count:dword; language_tags:Phb_tag_t; 
           language_index:Pdword; chosen_language:Phb_tag_t):Thb_bool_t;cdecl;external;
{ OUT  }function hb_ot_layout_language_get_required_feature_index(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_index:dword; feature_index:Pdword):Thb_bool_t;cdecl;external;
{ OUT  }{ OUT  }function hb_ot_layout_language_get_required_feature(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_index:dword; feature_index:Pdword; 
           feature_tag:Phb_tag_t):Thb_bool_t;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_language_get_feature_indexes(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_index:dword; start_offset:dword; 
           feature_count:Pdword; feature_indexes:Pdword):dword;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_language_get_feature_tags(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_index:dword; start_offset:dword; 
           feature_count:Pdword; feature_tags:Phb_tag_t):dword;cdecl;external;
{ OUT  }function hb_ot_layout_language_find_feature(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_index:dword; feature_tag:Thb_tag_t; 
           feature_index:Pdword):Thb_bool_t;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_feature_get_lookups(face:Phb_face_t; table_tag:Thb_tag_t; feature_index:dword; start_offset:dword; lookup_count:Pdword; 
           lookup_indexes:Pdword):dword;cdecl;external;
function hb_ot_layout_table_get_lookup_count(face:Phb_face_t; table_tag:Thb_tag_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ OUT  }procedure hb_ot_layout_collect_features(face:Phb_face_t; table_tag:Thb_tag_t; scripts:Phb_tag_t; languages:Phb_tag_t; features:Phb_tag_t; 
            feature_indexes:Phb_set_t);cdecl;external;
{ OUT  }procedure hb_ot_layout_collect_features_map(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_index:dword; feature_map:Phb_map_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ OUT  }procedure hb_ot_layout_collect_lookups(face:Phb_face_t; table_tag:Thb_tag_t; scripts:Phb_tag_t; languages:Phb_tag_t; features:Phb_tag_t; 
            lookup_indexes:Phb_set_t);cdecl;external;
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }procedure hb_ot_layout_lookup_collect_glyphs(face:Phb_face_t; table_tag:Thb_tag_t; lookup_index:dword; glyphs_before:Phb_set_t; glyphs_input:Phb_set_t; 
            glyphs_after:Phb_set_t; glyphs_output:Phb_set_t);cdecl;external;
{ Variations support  }
(* Const before type ignored *)
{ out  }function hb_ot_layout_table_find_feature_variations(face:Phb_face_t; table_tag:Thb_tag_t; coords:Plongint; num_coords:dword; variations_index:Pdword):Thb_bool_t;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_feature_with_variations_get_lookups(face:Phb_face_t; table_tag:Thb_tag_t; feature_index:dword; variations_index:dword; start_offset:dword; 
           lookup_count:Pdword; lookup_indexes:Pdword):dword;cdecl;external;
{
 * GSUB
  }
function hb_ot_layout_has_substitution(face:Phb_face_t):Thb_bool_t;cdecl;external;
{ IN/OUT  }{ OUT  }function hb_ot_layout_lookup_get_glyph_alternates(face:Phb_face_t; lookup_index:dword; glyph:Thb_codepoint_t; start_offset:dword; alternate_count:Pdword; 
           alternate_glyphs:Phb_codepoint_t):dword;cdecl;external;
(* Const before type ignored *)
function hb_ot_layout_lookup_would_substitute(face:Phb_face_t; lookup_index:dword; glyphs:Phb_codepoint_t; glyphs_length:dword; zero_context:Thb_bool_t):Thb_bool_t;cdecl;external;
{TODO , hb_bool_t  inclusive  }procedure hb_ot_layout_lookup_substitute_closure(face:Phb_face_t; lookup_index:dword; glyphs:Phb_set_t);cdecl;external;
(* Const before type ignored *)
procedure hb_ot_layout_lookups_substitute_closure(face:Phb_face_t; lookups:Phb_set_t; glyphs:Phb_set_t);cdecl;external;
{
 * GPOS
  }
function hb_ot_layout_has_positioning(face:Phb_face_t):Thb_bool_t;cdecl;external;
{ Optical 'size' feature info.  Returns true if found.
 * https://docs.microsoft.com/en-us/typography/opentype/spec/features_pt#size  }
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }
{ OUT.  May be NULL  }function hb_ot_layout_get_size_params(face:Phb_face_t; design_size:Pdword; subfamily_id:Pdword; subfamily_name_id:Phb_ot_name_id_t; range_start:Pdword; 
           range_end:Pdword):Thb_bool_t;cdecl;external;
function hb_ot_layout_lookup_get_optical_bound(font:Phb_font_t; lookup_index:dword; direction:Thb_direction_t; glyph:Thb_codepoint_t):Thb_position_t;cdecl;external;
{
 * GSUB/GPOS
  }
{ OUT.  May be NULL  }{ OUT.  May be NULL  }{ OUT.  May be NULL  }{ OUT.  May be NULL  }{ OUT.  May be NULL  }function hb_ot_layout_feature_get_name_ids(face:Phb_face_t; table_tag:Thb_tag_t; feature_index:dword; label_id:Phb_ot_name_id_t; tooltip_id:Phb_ot_name_id_t; 
           sample_id:Phb_ot_name_id_t; num_named_parameters:Pdword; first_param_id:Phb_ot_name_id_t):Thb_bool_t;cdecl;external;
{ IN/OUT.  May be NULL  }{ OUT.     May be NULL  }function hb_ot_layout_feature_get_characters(face:Phb_face_t; table_tag:Thb_tag_t; feature_index:dword; start_offset:dword; char_count:Pdword; 
           characters:Phb_codepoint_t):dword;cdecl;external;
{
 * BASE
  }
function hb_ot_layout_get_font_extents(font:Phb_font_t; direction:Thb_direction_t; script_tag:Thb_tag_t; language_tag:Thb_tag_t; extents:Phb_font_extents_t):Thb_bool_t;cdecl;external;
function hb_ot_layout_get_font_extents2(font:Phb_font_t; direction:Thb_direction_t; script:Thb_script_t; language:Thb_language_t; extents:Phb_font_extents_t):Thb_bool_t;cdecl;external;
{*
 * hb_ot_layout_baseline_tag_t:
 * @HB_OT_LAYOUT_BASELINE_TAG_ROMAN: The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
 * In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
 * (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
 * characters are not rotated.)
 * @HB_OT_LAYOUT_BASELINE_TAG_HANGING: The hanging baseline. In horizontal direction, this is the horizontal
 * line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
 * for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_BOTTOM_OR_LEFT: Ideographic character face bottom or left edge,
 * if the direction is horizontal or vertical, respectively.
 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_TOP_OR_RIGHT: Ideographic character face top or right edge,
 * if the direction is horizontal or vertical, respectively.
 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_CENTRAL: The center of the ideographic character face. Since: 4.0.0
 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_BOTTOM_OR_LEFT: Ideographic em-box bottom or left edge,
 * if the direction is horizontal or vertical, respectively.
 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_TOP_OR_RIGHT: Ideographic em-box top or right edge baseline,
 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_CENTRAL: The center of the ideographic em-box. Since: 4.0.0
 * if the direction is horizontal or vertical, respectively.
 * @HB_OT_LAYOUT_BASELINE_TAG_MATH: The baseline about which mathematical characters are centered.
 * In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
 *
 * Baseline tags from [Baseline Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags) registry.
 *
 * Since: 2.6.0
  }
{< private > }
{< skip > }
type
  Phb_ot_layout_baseline_tag_t = ^Thb_ot_layout_baseline_tag_t;
  Thb_ot_layout_baseline_tag_t =  Longint;
  Const
    HB_OT_LAYOUT_BASELINE_TAG_ROMAN = HB_TAG('r','o','m','n');
    HB_OT_LAYOUT_BASELINE_TAG_HANGING = HB_TAG('h','a','n','g');
    HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_BOTTOM_OR_LEFT = HB_TAG('i','c','f','b');
    HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_TOP_OR_RIGHT = HB_TAG('i','c','f','t');
    HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_CENTRAL = HB_TAG('I','c','f','c');
    HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_BOTTOM_OR_LEFT = HB_TAG('i','d','e','o');
    HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_TOP_OR_RIGHT = HB_TAG('i','d','t','p');
    HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_CENTRAL = HB_TAG('I','d','c','e');
    HB_OT_LAYOUT_BASELINE_TAG_MATH = HB_TAG('m','a','t','h');
    _HB_OT_LAYOUT_BASELINE_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED;
;

function hb_ot_layout_get_horizontal_baseline_tag_for_script(script:Thb_script_t):Thb_ot_layout_baseline_tag_t;cdecl;external;
{ OUT.  May be NULL.  }function hb_ot_layout_get_baseline(font:Phb_font_t; baseline_tag:Thb_ot_layout_baseline_tag_t; direction:Thb_direction_t; script_tag:Thb_tag_t; language_tag:Thb_tag_t; 
           coord:Phb_position_t):Thb_bool_t;cdecl;external;
{ OUT.  May be NULL.  }function hb_ot_layout_get_baseline2(font:Phb_font_t; baseline_tag:Thb_ot_layout_baseline_tag_t; direction:Thb_direction_t; script:Thb_script_t; language:Thb_language_t; 
           coord:Phb_position_t):Thb_bool_t;cdecl;external;
{ OUT  }procedure hb_ot_layout_get_baseline_with_fallback(font:Phb_font_t; baseline_tag:Thb_ot_layout_baseline_tag_t; direction:Thb_direction_t; script_tag:Thb_tag_t; language_tag:Thb_tag_t; 
            coord:Phb_position_t);cdecl;external;
{ OUT  }procedure hb_ot_layout_get_baseline_with_fallback2(font:Phb_font_t; baseline_tag:Thb_ot_layout_baseline_tag_t; direction:Thb_direction_t; script:Thb_script_t; language:Thb_language_t; 
            coord:Phb_position_t);cdecl;external;
{$endif}
{ HB_OT_LAYOUT_H  }

implementation

{ was #define dname def_expr }
function HB_OT_TAG_BASE : longint; { return type might be wrong }
  begin
    HB_OT_TAG_BASE:=HB_TAG('B','A','S','E');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_GDEF : longint; { return type might be wrong }
  begin
    HB_OT_TAG_GDEF:=HB_TAG('G','D','E','F');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_GSUB : longint; { return type might be wrong }
  begin
    HB_OT_TAG_GSUB:=HB_TAG('G','S','U','B');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_GPOS : longint; { return type might be wrong }
  begin
    HB_OT_TAG_GPOS:=HB_TAG('G','P','O','S');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_JSTF : longint; { return type might be wrong }
  begin
    HB_OT_TAG_JSTF:=HB_TAG('J','S','T','F');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_DEFAULT_SCRIPT : longint; { return type might be wrong }
  begin
    HB_OT_TAG_DEFAULT_SCRIPT:=HB_TAG('D','F','L','T');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_DEFAULT_LANGUAGE : longint; { return type might be wrong }
  begin
    HB_OT_TAG_DEFAULT_LANGUAGE:=HB_TAG('d','f','l','t');
  end;


end.
