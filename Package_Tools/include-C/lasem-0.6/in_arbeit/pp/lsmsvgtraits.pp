
unit lsmsvgtraits;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgtraits.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgtraits.h
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
Pdouble  = ^double;
PLsmSvgAngle  = ^LsmSvgAngle;
PLsmSvgColor  = ^LsmSvgColor;
PLsmSvgDashArray  = ^LsmSvgDashArray;
PLsmSvgLength  = ^LsmSvgLength;
PLsmSvgOneOrTwoDouble  = ^LsmSvgOneOrTwoDouble;
PLsmSvgOneOrTwoInteger  = ^LsmSvgOneOrTwoInteger;
PLsmSvgPaint  = ^LsmSvgPaint;
PLsmSvgPreserveAspectRatio  = ^LsmSvgPreserveAspectRatio;
PLsmSvgVector  = ^LsmSvgVector;
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
{$ifndef LSM_SVG_TRAITS_H}
{$define LSM_SVG_TRAITS_H}
{$include <lsm.h>}
{$include <lsmsvglength.h>}
{$include <lsmsvgmatrix.h>}
type
  PLsmSvgVector = ^TLsmSvgVector;
  TLsmSvgVector = record
      n_values : dword;
      values : Pdouble;
    end;

  PLsmSvgAngle = ^TLsmSvgAngle;
  TLsmSvgAngle = record
      _type : TLsmSvgAngleType;
      angle : Tdouble;
    end;

  PLsmSvgColor = ^TLsmSvgColor;
  TLsmSvgColor = record
      red : Tdouble;
      green : Tdouble;
      blue : Tdouble;
    end;
(* Const before type ignored *)
  var
    lsm_svg_color_null : TLsmSvgColor;cvar;external;
type
  PLsmSvgDashArray = ^TLsmSvgDashArray;
  TLsmSvgDashArray = record
      n_dashes : dword;
      dashes : PLsmSvgLength;
    end;
(* Const before type ignored *)
  var
    lsm_svg_dash_array_null : TLsmSvgDashArray;cvar;external;

function lsm_svg_dash_array_new(n_dashes:dword):PLsmSvgDashArray;cdecl;external;
procedure lsm_svg_dash_array_free(array:PLsmSvgDashArray);cdecl;external;
(* Const before type ignored *)
function lsm_svg_dash_array_duplicate(origin:PLsmSvgDashArray):PLsmSvgDashArray;cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_dash_array_copy(to:PLsmSvgDashArray; from:PLsmSvgDashArray);cdecl;external;
type
  PLsmSvgPaint = ^TLsmSvgPaint;
  TLsmSvgPaint = record
      _type : TLsmSvgPaintType;
      url : Pchar;
      color : TLsmSvgColor;
    end;

  PLsmSvgPreserveAspectRatio = ^TLsmSvgPreserveAspectRatio;
  TLsmSvgPreserveAspectRatio = record
      defer : Tgboolean;
      align : TLsmSvgAlign;
      meet_or_slice : TLsmSvgMeetOrSlice;
    end;

  PLsmSvgOneOrTwoDouble = ^TLsmSvgOneOrTwoDouble;
  TLsmSvgOneOrTwoDouble = record
      a : Tdouble;
      b : Tdouble;
    end;

  PLsmSvgOneOrTwoInteger = ^TLsmSvgOneOrTwoInteger;
  TLsmSvgOneOrTwoInteger = record
      a : longint;
      b : longint;
    end;
(* Const before type ignored *)
  var
    lsm_svg_angle_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_blending_mode_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_enable_background_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_channel_selector_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_color_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_color_filter_type_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_comp_op_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_dash_array_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_display_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_edge_mode_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_fill_rule_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_font_stretch_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_font_style_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_font_weight_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_one_or_two_integer_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_length_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_length_list_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_line_join_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_line_cap_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_marker_units_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_matrix_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_morphology_operator_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_one_or_two_double_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_overflow_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_paint_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_pattern_units_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_preserve_aspect_ratio_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_spread_method_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_stitch_tiles_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_text_anchor_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_turbulence_type_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_vector_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_visibility_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_svg_writing_mode_trait_class : TLsmTraitClass;cvar;external;
{$endif}

implementation


end.
