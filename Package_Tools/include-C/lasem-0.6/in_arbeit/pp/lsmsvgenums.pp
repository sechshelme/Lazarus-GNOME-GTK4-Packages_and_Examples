
unit lsmsvgenums;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgenums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgenums.h
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
PLsmSvgAlign  = ^LsmSvgAlign;
PLsmSvgAngleType  = ^LsmSvgAngleType;
PLsmSvgBlendingMode  = ^LsmSvgBlendingMode;
PLsmSvgChannelSelector  = ^LsmSvgChannelSelector;
PLsmSvgColorFilterType  = ^LsmSvgColorFilterType;
PLsmSvgCompOp  = ^LsmSvgCompOp;
PLsmSvgDisplay  = ^LsmSvgDisplay;
PLsmSvgEdgeMode  = ^LsmSvgEdgeMode;
PLsmSvgElementCategory  = ^LsmSvgElementCategory;
PLsmSvgEnableBackground  = ^LsmSvgEnableBackground;
PLsmSvgFillRule  = ^LsmSvgFillRule;
PLsmSvgFilterInput  = ^LsmSvgFilterInput;
PLsmSvgFontStretch  = ^LsmSvgFontStretch;
PLsmSvgFontStyle  = ^LsmSvgFontStyle;
PLsmSvgFontWeight  = ^LsmSvgFontWeight;
PLsmSvgLengthDirection  = ^LsmSvgLengthDirection;
PLsmSvgLengthType  = ^LsmSvgLengthType;
PLsmSvgLineCap  = ^LsmSvgLineCap;
PLsmSvgLineJoin  = ^LsmSvgLineJoin;
PLsmSvgMarkerUnits  = ^LsmSvgMarkerUnits;
PLsmSvgMeetOrSlice  = ^LsmSvgMeetOrSlice;
PLsmSvgMorphologyOperator  = ^LsmSvgMorphologyOperator;
PLsmSvgOverflow  = ^LsmSvgOverflow;
PLsmSvgPaintType  = ^LsmSvgPaintType;
PLsmSvgPatternUnits  = ^LsmSvgPatternUnits;
PLsmSvgSpreadMethod  = ^LsmSvgSpreadMethod;
PLsmSvgStitchTiles  = ^LsmSvgStitchTiles;
PLsmSvgTextAnchor  = ^LsmSvgTextAnchor;
PLsmSvgTransformType  = ^LsmSvgTransformType;
PLsmSvgTurbulenceType  = ^LsmSvgTurbulenceType;
PLsmSvgVisibility  = ^LsmSvgVisibility;
PLsmSvgWritingMode  = ^LsmSvgWritingMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_SVG_ENUMS_H}
{$define LSM_SVG_ENUMS_H}
{$include <glib-object.h>}
{$include <lsmtypes.h>}
type
  PLsmSvgAngleType = ^TLsmSvgAngleType;
  TLsmSvgAngleType =  Longint;
  Const
    LSM_SVG_ANGLE_TYPE_ERROR = -(1);
    LSM_SVG_ANGLE_TYPE_AUTO = (-(1))+1;
    LSM_SVG_ANGLE_TYPE_FIXED = (-(1))+2;
;
type
  PLsmSvgBlendingMode = ^TLsmSvgBlendingMode;
  TLsmSvgBlendingMode =  Longint;
  Const
    LSM_SVG_BLENDING_MODE_ERROR = -(1);
    LSM_SVG_BLENDING_MODE_NORMAL = (-(1))+1;
    LSM_SVG_BLENDING_MODE_MULTIPLY = (-(1))+2;
    LSM_SVG_BLENDING_MODE_SCREEN = (-(1))+3;
    LSM_SVG_BLENDING_MODE_DARKEN = (-(1))+4;
    LSM_SVG_BLENDING_MODE_LIGHTEN = (-(1))+5;
    LSM_SVG_BLENDING_MODE_OVER = (-(1))+6;
    LSM_SVG_BLENDING_MODE_IN = (-(1))+7;
    LSM_SVG_BLENDING_MODE_OUT = (-(1))+8;
    LSM_SVG_BLENDING_MODE_ATOP = (-(1))+9;
    LSM_SVG_BLENDING_MODE_XOR = (-(1))+10;
;
(* Const before type ignored *)

function lsm_svg_blending_mode_to_string(blending_mode:TLsmSvgBlendingMode):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_blending_mode_from_string(_string:Pchar):TLsmSvgBlendingMode;cdecl;external;
type
  PLsmSvgEnableBackground = ^TLsmSvgEnableBackground;
  TLsmSvgEnableBackground =  Longint;
  Const
    LSM_SVG_ENABLE_BACKGROUND_ERROR = -(1);
    LSM_SVG_ENABLE_BACKGROUND_ACCUMULATE = (-(1))+1;
    LSM_SVG_ENABLE_BACKGROUND_NEW = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_enable_background_to_string(enable_background:TLsmSvgEnableBackground):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_enable_background_from_string(_string:Pchar):TLsmSvgEnableBackground;cdecl;external;
type
  PLsmSvgPaintType = ^TLsmSvgPaintType;
  TLsmSvgPaintType =  Longint;
  Const
    LSM_SVG_PAINT_TYPE_ERROR = -(1);
    LSM_SVG_PAINT_TYPE_UNKNOWN = 0;
    LSM_SVG_PAINT_TYPE_RGB_COLOR = 1;
    LSM_SVG_PAINT_TYPE_RGB_COLOR_ICC_COLOR = 2;
    LSM_SVG_PAINT_TYPE_NONE = 101;
    LSM_SVG_PAINT_TYPE_CURRENT_COLOR = 102;
    LSM_SVG_PAINT_TYPE_URI_NONE = 103;
    LSM_SVG_PAINT_TYPE_URI_CURRENT_COLOR = 104;
    LSM_SVG_PAINT_TYPE_URI_RGB_COLOR = 105;
    LSM_SVG_PAINT_TYPE_URI_RGB_COLOR_ICC_COLOR = 106;
    LSM_SVG_PAINT_TYPE_URI = 107;
;
type
  PLsmSvgLengthDirection = ^TLsmSvgLengthDirection;
  TLsmSvgLengthDirection =  Longint;
  Const
    LSM_SVG_LENGTH_DIRECTION_ERROR = -(1);
    LSM_SVG_LENGTH_DIRECTION_HORIZONTAL = (-(1))+1;
    LSM_SVG_LENGTH_DIRECTION_VERTICAL = (-(1))+2;
    LSM_SVG_LENGTH_DIRECTION_DIAGONAL = (-(1))+3;
;
type
  PLsmSvgLengthType = ^TLsmSvgLengthType;
  TLsmSvgLengthType =  Longint;
  Const
    LSM_SVG_LENGTH_TYPE_ERROR = -(1);
    LSM_SVG_LENGTH_TYPE_NUMBER = (-(1))+1;
    LSM_SVG_LENGTH_TYPE_PERCENTAGE = (-(1))+2;
    LSM_SVG_LENGTH_TYPE_EMS = (-(1))+3;
    LSM_SVG_LENGTH_TYPE_EXS = (-(1))+4;
    LSM_SVG_LENGTH_TYPE_PX = (-(1))+5;
    LSM_SVG_LENGTH_TYPE_CM = (-(1))+6;
    LSM_SVG_LENGTH_TYPE_MM = (-(1))+7;
    LSM_SVG_LENGTH_TYPE_IN = (-(1))+8;
    LSM_SVG_LENGTH_TYPE_PT = (-(1))+9;
    LSM_SVG_LENGTH_TYPE_PC = (-(1))+10;
;
(* Const before type ignored *)

function lsm_svg_length_type_to_string(length_type:TLsmSvgLengthType):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_length_type_from_string(_string:Pchar):TLsmSvgLengthType;cdecl;external;
type
  PLsmSvgFillRule = ^TLsmSvgFillRule;
  TLsmSvgFillRule =  Longint;
  Const
    LSM_SVG_FILL_RULE_ERROR = -(1);
    LSM_SVG_FILL_RULE_NON_ZERO = (-(1))+1;
    LSM_SVG_FILL_RULE_EVEN_ODD = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_fill_rule_to_string(fill_rule:TLsmSvgFillRule):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_fill_rule_from_string(_string:Pchar):TLsmSvgFillRule;cdecl;external;
type
  PLsmSvgLineJoin = ^TLsmSvgLineJoin;
  TLsmSvgLineJoin =  Longint;
  Const
    LSM_SVG_LINE_JOIN_ERROR = -(1);
    LSM_SVG_LINE_JOIN_MITER = (-(1))+1;
    LSM_SVG_LINE_JOIN_ROUND = (-(1))+2;
    LSM_SVG_LINE_JOIN_BEVEL = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_line_join_to_string(line_join:TLsmSvgLineJoin):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_line_join_from_string(_string:Pchar):TLsmSvgLineJoin;cdecl;external;
type
  PLsmSvgLineCap = ^TLsmSvgLineCap;
  TLsmSvgLineCap =  Longint;
  Const
    LSM_SVG_LINE_CAP_ERROR = -(1);
    LSM_SVG_LINE_CAP_BUTT = (-(1))+1;
    LSM_SVG_LINE_CAP_ROUND = (-(1))+2;
    LSM_SVG_LINE_CAP_SQUARE = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_line_cap_to_string(line_cap:TLsmSvgLineCap):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_line_cap_from_string(_string:Pchar):TLsmSvgLineCap;cdecl;external;
type
  PLsmSvgTransformType = ^TLsmSvgTransformType;
  TLsmSvgTransformType =  Longint;
  Const
    LSM_SVG_TRANSFORM_TYPE_ERROR = -(1);
    LSM_SVG_TRANSFORM_TYPE_MATRIX = (-(1))+1;
    LSM_SVG_TRANSFORM_TYPE_TRANSLATE = (-(1))+2;
    LSM_SVG_TRANSFORM_TYPE_SCALE = (-(1))+3;
    LSM_SVG_TRANSFORM_TYPE_ROTATE = (-(1))+4;
    LSM_SVG_TRANSFORM_TYPE_SKEW_X = (-(1))+5;
    LSM_SVG_TRANSFORM_TYPE_SKEW_Y = (-(1))+6;
;
type
  PLsmSvgOverflow = ^TLsmSvgOverflow;
  TLsmSvgOverflow =  Longint;
  Const
    LSM_SVG_OVERFLOW_ERROR = -(1);
    LSM_SVG_OVERFLOW_VISIBLE = (-(1))+1;
    LSM_SVG_OVERFLOW_HIDDEN = (-(1))+2;
    LSM_SVG_OVERFLOW_SCROLL = (-(1))+3;
    LSM_SVG_OVERFLOW_AUTO = (-(1))+4;
;
(* Const before type ignored *)

function lsm_svg_overflow_to_string(overflow:TLsmSvgOverflow):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_overflow_from_string(_string:Pchar):TLsmSvgOverflow;cdecl;external;
type
  PLsmSvgPatternUnits = ^TLsmSvgPatternUnits;
  TLsmSvgPatternUnits =  Longint;
  Const
    LSM_SVG_PATTERN_UNITS_ERROR = -(1);
    LSM_SVG_PATTERN_UNITS_USER_SPACE_ON_USE = (-(1))+1;
    LSM_SVG_PATTERN_UNITS_OBJECT_BOUNDING_BOX = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_pattern_units_to_string(units:TLsmSvgPatternUnits):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_pattern_units_from_string(_string:Pchar):TLsmSvgPatternUnits;cdecl;external;
type
  PLsmSvgMarkerUnits = ^TLsmSvgMarkerUnits;
  TLsmSvgMarkerUnits =  Longint;
  Const
    LSM_SVG_MARKER_UNITS_ERROR = -(1);
    LSM_SVG_MARKER_UNITS_STROKE_WIDTH = (-(1))+1;
    LSM_SVG_MARKER_UNITS_USER_SPACE_ON_USE = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_marker_units_to_string(units:TLsmSvgMarkerUnits):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_marker_units_from_string(_string:Pchar):TLsmSvgMarkerUnits;cdecl;external;
type
  PLsmSvgSpreadMethod = ^TLsmSvgSpreadMethod;
  TLsmSvgSpreadMethod =  Longint;
  Const
    LSM_SVG_SPREAD_METHOD_ERROR = -(1);
    LSM_SVG_SPREAD_METHOD_PAD = (-(1))+1;
    LSM_SVG_SPREAD_METHOD_REFLECT = (-(1))+2;
    LSM_SVG_SPREAD_METHOD_REPEAT = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_spread_method_to_string(method:TLsmSvgSpreadMethod):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_spread_method_from_string(_string:Pchar):TLsmSvgSpreadMethod;cdecl;external;
type
  PLsmSvgAlign = ^TLsmSvgAlign;
  TLsmSvgAlign =  Longint;
  Const
    LSM_SVG_ALIGN_ERROR = -(1);
    LSM_SVG_ALIGN_NONE = (-(1))+1;
    LSM_SVG_ALIGN_X_MIN_Y_MIN = (-(1))+2;
    LSM_SVG_ALIGN_X_MID_Y_MIN = (-(1))+3;
    LSM_SVG_ALIGN_X_MAX_Y_MIN = (-(1))+4;
    LSM_SVG_ALIGN_X_MIN_Y_MID = (-(1))+5;
    LSM_SVG_ALIGN_X_MID_Y_MID = (-(1))+6;
    LSM_SVG_ALIGN_X_MAX_Y_MID = (-(1))+7;
    LSM_SVG_ALIGN_X_MIN_Y_MAX = (-(1))+8;
    LSM_SVG_ALIGN_X_MID_Y_MAX = (-(1))+9;
    LSM_SVG_ALIGN_X_MAX_Y_MAX = (-(1))+10;
;
(* Const before type ignored *)

function lsm_svg_align_to_string(align:TLsmSvgAlign):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_align_from_string(_string:Pchar):TLsmSvgAlign;cdecl;external;
type
  PLsmSvgMeetOrSlice = ^TLsmSvgMeetOrSlice;
  TLsmSvgMeetOrSlice =  Longint;
  Const
    LSM_SVG_MEET_OR_SLICE_ERROR = -(1);
    LSM_SVG_MEET_OR_SLICE_MEET = (-(1))+1;
    LSM_SVG_MEET_OR_SLICE_SLICE = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_meet_or_slice_to_string(meet_or_slice:TLsmSvgMeetOrSlice):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_meet_or_slice_from_string(_string:Pchar):TLsmSvgMeetOrSlice;cdecl;external;
type
  PLsmSvgCompOp = ^TLsmSvgCompOp;
  TLsmSvgCompOp =  Longint;
  Const
    LSM_SVG_COMP_OP_ERROR = -(1);
    LSM_SVG_COMP_OP_CLEAR = (-(1))+1;
    LSM_SVG_COMP_OP_SRC = (-(1))+2;
    LSM_SVG_COMP_OP_DST = (-(1))+3;
    LSM_SVG_COMP_OP_SRC_OVER = (-(1))+4;
    LSM_SVG_COMP_OP_DST_OVER = (-(1))+5;
    LSM_SVG_COMP_OP_SRC_IN = (-(1))+6;
    LSM_SVG_COMP_OP_DST_IN = (-(1))+7;
    LSM_SVG_COMP_OP_SRC_OUT = (-(1))+8;
    LSM_SVG_COMP_OP_DST_OUT = (-(1))+9;
    LSM_SVG_COMP_OP_SRC_ATOP = (-(1))+10;
    LSM_SVG_COMP_OP_DST_ATOP = (-(1))+11;
    LSM_SVG_COMP_OP_XOR = (-(1))+12;
    LSM_SVG_COMP_OP_PLUS = (-(1))+13;
    LSM_SVG_COMP_OP_MULTIPLY = (-(1))+14;
    LSM_SVG_COMP_OP_SCREEN = (-(1))+15;
    LSM_SVG_COMP_OP_OVERLAY = (-(1))+16;
    LSM_SVG_COMP_OP_DARKEN = (-(1))+17;
    LSM_SVG_COMP_OP_LIGHTEN = (-(1))+18;
    LSM_SVG_COMP_OP_COLOR_DODGE = (-(1))+19;
    LSM_SVG_COMP_OP_COLOR_BURN = (-(1))+20;
    LSM_SVG_COMP_OP_HARD_LIGHT = (-(1))+21;
    LSM_SVG_COMP_OP_SOFT_LIGHT = (-(1))+22;
    LSM_SVG_COMP_OP_DIFFERENCE = (-(1))+23;
    LSM_SVG_COMP_OP_EXCLUSION = (-(1))+24;
;
(* Const before type ignored *)

function lsm_svg_comp_op_to_string(comp_op:TLsmSvgCompOp):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_comp_op_from_string(_string:Pchar):TLsmSvgCompOp;cdecl;external;
type
  PLsmSvgFontStretch = ^TLsmSvgFontStretch;
  TLsmSvgFontStretch =  Longint;
  Const
    LSM_SVG_FONT_STRETCH_ERROR = -(1);
    LSM_SVG_FONT_STRETCH_NORMAL = (-(1))+1;
    LSM_SVG_FONT_STRETCH_ULTRA_CONDENSED = (-(1))+2;
    LSM_SVG_FONT_STRETCH_EXTRA_CONDENSED = (-(1))+3;
    LSM_SVG_FONT_STRETCH_CONDENSED = (-(1))+4;
    LSM_SVG_FONT_STRETCH_SEMI_CONDENSED = (-(1))+5;
    LSM_SVG_FONT_STRETCH_SEMI_EXPANDED = (-(1))+6;
    LSM_SVG_FONT_STRETCH_EXPANDED = (-(1))+7;
    LSM_SVG_FONT_STRETCH_EXTRA_EXPANDED = (-(1))+8;
    LSM_SVG_FONT_STRETCH_ULTRA_EXPANDED = (-(1))+9;
;
(* Const before type ignored *)

function lsm_svg_font_stretch_to_string(font_stretch:TLsmSvgFontStretch):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_font_stretch_from_string(_string:Pchar):TLsmSvgFontStretch;cdecl;external;
type
  PLsmSvgFontStyle = ^TLsmSvgFontStyle;
  TLsmSvgFontStyle =  Longint;
  Const
    LSM_SVG_FONT_STYLE_ERROR = -(1);
    LSM_SVG_FONT_STYLE_NORMAL = (-(1))+1;
    LSM_SVG_FONT_STYLE_OBLIQUE = (-(1))+2;
    LSM_SVG_FONT_STYLE_ITALIC = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_font_style_to_string(font_style:TLsmSvgFontStyle):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_font_style_from_string(_string:Pchar):TLsmSvgFontStyle;cdecl;external;
type
  PLsmSvgFontWeight = ^TLsmSvgFontWeight;
  TLsmSvgFontWeight =  Longint;
  Const
    LSM_SVG_FONT_WEIGHT_ERROR = -(1);
    LSM_SVG_FONT_WEIGHT_NORMAL = 400;
    LSM_SVG_FONT_WEIGHT_BOLD = 700;
;
(* Const before type ignored *)

function lsm_svg_font_weight_to_string(font_weight:TLsmSvgFontWeight):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_font_weight_from_string(_string:Pchar):TLsmSvgFontWeight;cdecl;external;
type
  PLsmSvgTextAnchor = ^TLsmSvgTextAnchor;
  TLsmSvgTextAnchor =  Longint;
  Const
    LSM_SVG_TEXT_ANCHOR_ERROR = -(1);
    LSM_SVG_TEXT_ANCHOR_START = (-(1))+1;
    LSM_SVG_TEXT_ANCHOR_MIDDLE = (-(1))+2;
    LSM_SVG_TEXT_ANCHOR_END = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_text_anchor_to_string(text_anchor:TLsmSvgTextAnchor):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_text_anchor_from_string(_string:Pchar):TLsmSvgTextAnchor;cdecl;external;
type
  PLsmSvgFilterInput = ^TLsmSvgFilterInput;
  TLsmSvgFilterInput =  Longint;
  Const
    LSM_SVG_FILTER_INPUT_ERROR = -(1);
    LSM_SVG_FILTER_INPUT_SOURCE_GRAPHIC = (-(1))+1;
    LSM_SVG_FILTER_INPUT_SOURCE_ALPHA = (-(1))+2;
    LSM_SVG_FILTER_INPUT_BACKGROUND_IMAGE = (-(1))+3;
    LSM_SVG_FILTER_INPUT_BACKGROUND_ALPHA = (-(1))+4;
    LSM_SVG_FILTER_INPUT_FILL_PAINT = (-(1))+5;
    LSM_SVG_FILTER_INPUT_STROKE_PAINT = (-(1))+6;
;
type
  PLsmSvgDisplay = ^TLsmSvgDisplay;
  TLsmSvgDisplay =  Longint;
  Const
    LSM_SVG_DISPLAY_ERROR = -(1);
    LSM_SVG_DISPLAY_NONE = (-(1))+1;
    LSM_SVG_DISPLAY_INLINE = (-(1))+2;
    LSM_SVG_DISPLAY_BLOCK = (-(1))+3;
    LSM_SVG_DISPLAY_LIST_ITEM = (-(1))+4;
    LSM_SVG_DISPLAY_RUN_IN = (-(1))+5;
    LSM_SVG_DISPLAY_COMPACT = (-(1))+6;
    LSM_SVG_DISPLAY_MARKER = (-(1))+7;
    LSM_SVG_DISPLAY_TABLE = (-(1))+8;
    LSM_SVG_DISPLAY_INLINE_TABLE = (-(1))+9;
    LSM_SVG_DISPLAY_TABLE_ROW_GROUP = (-(1))+10;
    LSM_SVG_DISPLAY_TABLE_HEADER_GROUP = (-(1))+11;
    LSM_SVG_DISPLAY_TABLE_FOOTER_GROUP = (-(1))+12;
    LSM_SVG_DISPLAY_TABLE_ROW = (-(1))+13;
    LSM_SVG_DISPLAY_TABLE_COLUMN_GROUP = (-(1))+14;
    LSM_SVG_DISPLAY_TABLE_COLUMN = (-(1))+15;
    LSM_SVG_DISPLAY_TABLE_CELL = (-(1))+16;
    LSM_SVG_DISPLAY_TABLE_CAPTION = (-(1))+17;
;
(* Const before type ignored *)

function lsm_svg_display_to_string(display:TLsmSvgDisplay):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_display_from_string(_string:Pchar):TLsmSvgDisplay;cdecl;external;
type
  PLsmSvgVisibility = ^TLsmSvgVisibility;
  TLsmSvgVisibility =  Longint;
  Const
    LSM_SVG_VISIBILITY_ERROR = -(1);
    LSM_SVG_VISIBILITY_VISIBLE = (-(1))+1;
    LSM_SVG_VISIBILITY_HIDDEN = (-(1))+2;
    LSM_SVG_VISIBILITY_COLLAPSE = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_visibility_to_string(visibility:TLsmSvgVisibility):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_visibility_from_string(_string:Pchar):TLsmSvgVisibility;cdecl;external;
type
  PLsmSvgElementCategory = ^TLsmSvgElementCategory;
  TLsmSvgElementCategory =  Longint;
  Const
    LSM_SVG_ELEMENT_CATEGORY_NONE = 1 shl 0;
    LSM_SVG_ELEMENT_CATEGORY_DESCRIPTIVE = 1 shl 1;
    LSM_SVG_ELEMENT_CATEGORY_CONTAINER = 1 shl 2;
    LSM_SVG_ELEMENT_CATEGORY_STRUCTURAL = 1 shl 3;
    LSM_SVG_ELEMENT_CATEGORY_GRAPHICS_REFERENCING = 1 shl 4;
    LSM_SVG_ELEMENT_CATEGORY_GRAPHICS = 1 shl 5;
    LSM_SVG_ELEMENT_CATEGORY_SHAPE = 1 shl 6;
    LSM_SVG_ELEMENT_CATEGORY_BASIC_SHAPE = 1 shl 7;
    LSM_SVG_ELEMENT_CATEGORY_TEXT_CONTENT = 1 shl 8;
    LSM_SVG_ELEMENT_CATEGORY_TEXT_CONTENT_CHILD = 1 shl 9;
    LSM_SVG_ELEMENT_CATEGORY_GRADIENT = 1 shl 10;
    LSM_SVG_ELEMENT_CATEGORY_FILTER_PRIMITIVE = 1 shl 11;
    LSM_SVG_ELEMENT_CATEGORY_ANIMATION = 1 shl 12;
;
type
  PLsmSvgWritingMode = ^TLsmSvgWritingMode;
  TLsmSvgWritingMode =  Longint;
  Const
    LSM_SVG_WRITING_MODE_ERROR = -(1);
    LSM_SVG_WRITING_MODE_LR_TB = (-(1))+1;
    LSM_SVG_WRITING_MODE_RL_TB = (-(1))+2;
    LSM_SVG_WRITING_MODE_TB_RL = (-(1))+3;
    LSM_SVG_WRITING_MODE_LR = (-(1))+4;
    LSM_SVG_WRITING_MODE_RL = (-(1))+5;
    LSM_SVG_WRITING_MODE_TB = (-(1))+6;
;
(* Const before type ignored *)

function lsm_svg_writing_mode_to_string(writing_mode:TLsmSvgWritingMode):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_writing_mode_from_string(_string:Pchar):TLsmSvgWritingMode;cdecl;external;
type
  PLsmSvgColorFilterType = ^TLsmSvgColorFilterType;
  TLsmSvgColorFilterType =  Longint;
  Const
    LSM_SVG_COLOR_FILTER_TYPE_ERROR = -(1);
    LSM_SVG_COLOR_FILTER_TYPE_MATRIX = (-(1))+1;
    LSM_SVG_COLOR_FILTER_TYPE_SATURATE = (-(1))+2;
    LSM_SVG_COLOR_FILTER_TYPE_HUE_ROTATE = (-(1))+3;
    LSM_SVG_COLOR_FILTER_TYPE_LUMINANCE_TO_ALPHA = (-(1))+4;
;
(* Const before type ignored *)

function lsm_svg_color_filter_type_to_string(_type:TLsmSvgColorFilterType):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_color_filter_type_from_string(_string:Pchar):TLsmSvgColorFilterType;cdecl;external;
type
  PLsmSvgMorphologyOperator = ^TLsmSvgMorphologyOperator;
  TLsmSvgMorphologyOperator =  Longint;
  Const
    LSM_SVG_MORPHOLOGY_OPERATOR_ERROR = -(1);
    LSM_SVG_MORPHOLOGY_OPERATOR_ERODE = (-(1))+1;
    LSM_SVG_MORPHOLOGY_OPERATOR_DILATE = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_morphology_operator_to_string(morpholoy_operator:TLsmSvgMorphologyOperator):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_morphology_operator_from_string(_string:Pchar):TLsmSvgMorphologyOperator;cdecl;external;
type
  PLsmSvgEdgeMode = ^TLsmSvgEdgeMode;
  TLsmSvgEdgeMode =  Longint;
  Const
    LSM_SVG_EDGE_MODE_ERROR = -(1);
    LSM_SVG_EDGE_MODE_DUPLICATE = (-(1))+1;
    LSM_SVG_EDGE_MODE_WRAP = (-(1))+2;
    LSM_SVG_EDGE_MODE_NONE = (-(1))+3;
;
(* Const before type ignored *)

function lsm_svg_edge_mode_to_string(edge_mode:TLsmSvgEdgeMode):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_edge_mode_from_string(_string:Pchar):TLsmSvgEdgeMode;cdecl;external;
type
  PLsmSvgStitchTiles = ^TLsmSvgStitchTiles;
  TLsmSvgStitchTiles =  Longint;
  Const
    LSM_SVG_STITCH_TILES_ERROR = -(1);
    LSM_SVG_STITCH_TILES_NO_STITCH = (-(1))+1;
    LSM_SVG_STITCH_TILES_STITCH = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_stitch_tiles_to_string(stitch_tiles:TLsmSvgStitchTiles):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_stitch_tiles_from_string(_string:Pchar):TLsmSvgStitchTiles;cdecl;external;
type
  PLsmSvgTurbulenceType = ^TLsmSvgTurbulenceType;
  TLsmSvgTurbulenceType =  Longint;
  Const
    LSM_SVG_TURBULENCE_TYPE_ERROR = -(1);
    LSM_SVG_TURBULENCE_TYPE_TURBULENCE = (-(1))+1;
    LSM_SVG_TURBULENCE_TYPE_FRACTAL_NOISE = (-(1))+2;
;
(* Const before type ignored *)

function lsm_svg_turbulence_type_to_string(turbulence_type:TLsmSvgTurbulenceType):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_turbulence_type_from_string(_string:Pchar):TLsmSvgTurbulenceType;cdecl;external;
type
  PLsmSvgChannelSelector = ^TLsmSvgChannelSelector;
  TLsmSvgChannelSelector =  Longint;
  Const
    LSM_SVG_CHANNEL_SELECTOR_ERROR = -(1);
    LSM_SVG_CHANNEL_SELECTOR_RED = (-(1))+1;
    LSM_SVG_CHANNEL_SELECTOR_GREEN = (-(1))+2;
    LSM_SVG_CHANNEL_SELECTOR_BLUE = (-(1))+3;
    LSM_SVG_CHANNEL_SELECTOR_ALPHA = (-(1))+4;
;
(* Const before type ignored *)

function lsm_svg_channel_selector_to_string(channel_selector:TLsmSvgChannelSelector):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_svg_channel_selector_from_string(_string:Pchar):TLsmSvgChannelSelector;cdecl;external;
{$endif}

implementation


end.
