unit lsmsvgstyle;

interface

uses
  fp_glib2, fp_lasem;

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
{$ifndef LSM_SVG_STYLE_H}
{$define LSM_SVG_STYLE_H}
{$include <lsmsvgtraits.h>}
{$include <lsm.h>}
type
  PLsmSvgCompOpProperty = ^TLsmSvgCompOpProperty;
  TLsmSvgCompOpProperty = record
      base : TLsmProperty;
      value : TLsmSvgCompOp;
    end;

  PLsmSvgDoubleProperty = ^TLsmSvgDoubleProperty;
  TLsmSvgDoubleProperty = record
      base : TLsmProperty;
      value : Tdouble;
    end;

  PLsmSvgEnableBackgroundProperty = ^TLsmSvgEnableBackgroundProperty;
  TLsmSvgEnableBackgroundProperty = record
      base : TLsmProperty;
      value : TLsmSvgEnableBackground;
    end;

  PLsmSvgLengthProperty = ^TLsmSvgLengthProperty;
  TLsmSvgLengthProperty = record
      base : TLsmProperty;
      length : TLsmSvgLength;
    end;

  PLsmSvgOverflowProperty = ^TLsmSvgOverflowProperty;
  TLsmSvgOverflowProperty = record
      base : TLsmProperty;
      value : TLsmSvgOverflow;
    end;

  PLsmSvgPaintProperty = ^TLsmSvgPaintProperty;
  TLsmSvgPaintProperty = record
      base : TLsmProperty;
      paint : TLsmSvgPaint;
    end;

  PLsmSvgColorProperty = ^TLsmSvgColorProperty;
  TLsmSvgColorProperty = record
      base : TLsmProperty;
      value : TLsmSvgColor;
    end;

  PLsmSvgTransformProperty = ^TLsmSvgTransformProperty;
  TLsmSvgTransformProperty = record
      base : TLsmProperty;
      matrix : TLsmSvgMatrix;
    end;

  PLsmSvgFillRuleProperty = ^TLsmSvgFillRuleProperty;
  TLsmSvgFillRuleProperty = record
      base : TLsmProperty;
      value : TLsmSvgFillRule;
    end;

  PLsmSvgFontStretchProperty = ^TLsmSvgFontStretchProperty;
  TLsmSvgFontStretchProperty = record
      base : TLsmProperty;
      value : TLsmSvgFontStretch;
    end;

  PLsmSvgFontStyleProperty = ^TLsmSvgFontStyleProperty;
  TLsmSvgFontStyleProperty = record
      base : TLsmProperty;
      value : TLsmSvgFontStyle;
    end;

  PLsmSvgFontWeightProperty = ^TLsmSvgFontWeightProperty;
  TLsmSvgFontWeightProperty = record
      base : TLsmProperty;
      value : TLsmSvgFontWeight;
    end;

  PLsmSvgLineJoinProperty = ^TLsmSvgLineJoinProperty;
  TLsmSvgLineJoinProperty = record
      base : TLsmProperty;
      value : TLsmSvgLineJoin;
    end;

  PLsmSvgLineCapProperty = ^TLsmSvgLineCapProperty;
  TLsmSvgLineCapProperty = record
      base : TLsmProperty;
      value : TLsmSvgLineCap;
    end;

  PLsmSvgDashArrayProperty = ^TLsmSvgDashArrayProperty;
  TLsmSvgDashArrayProperty = record
      base : TLsmProperty;
      value : TLsmSvgDashArray;
    end;

  PLsmSvgTextAnchorProperty = ^TLsmSvgTextAnchorProperty;
  TLsmSvgTextAnchorProperty = record
      base : TLsmProperty;
      value : TLsmSvgTextAnchor;
    end;

  PLsmSvgDisplayProperty = ^TLsmSvgDisplayProperty;
  TLsmSvgDisplayProperty = record
      base : TLsmProperty;
      value : TLsmSvgDisplay;
    end;

  PLsmSvgVisibilityProperty = ^TLsmSvgVisibilityProperty;
  TLsmSvgVisibilityProperty = record
      base : TLsmProperty;
      value : TLsmSvgVisibility;
    end;

  PLsmSvgWritingModeProperty = ^TLsmSvgWritingModeProperty;
  TLsmSvgWritingModeProperty = record
      base : TLsmProperty;
      value : TLsmSvgWritingMode;
    end;
{ Not inherited  }
{ Inherited  }
  PLsmSvgStyle = ^TLsmSvgStyle;
  TLsmSvgStyle = record
      alignment_baseline : PLsmProperty;
      baseline_shift : PLsmProperty;
      clip : PLsmProperty;
      clip_path : PLsmProperty;
      comp_op : PLsmSvgCompOpProperty;
      dominant_baseline : PLsmProperty;
      enable_background : PLsmSvgEnableBackgroundProperty;
      filter : PLsmProperty;
      flood_color : PLsmSvgColorProperty;
      flood_opacity : PLsmSvgDoubleProperty;
      lighting_color : PLsmSvgColorProperty;
      mask : PLsmProperty;
      opacity : PLsmSvgDoubleProperty;
      overflow : PLsmSvgOverflowProperty;
      stop_color : PLsmSvgColorProperty;
      stop_opacity : PLsmSvgDoubleProperty;
      text_decoration : PLsmProperty;
      unicode_bidi : PLsmProperty;
      viewport_fill : PLsmSvgPaintProperty;
      viewport_fill_opacity : PLsmSvgDoubleProperty;
      clip_rule : PLsmSvgFillRuleProperty;
      color : PLsmSvgColorProperty;
      color_interpolation : PLsmProperty;
      color_interpolation_filters : PLsmProperty;
      color_profile : PLsmProperty;
      color_rendering : PLsmProperty;
      cursor : PLsmProperty;
      direction : PLsmProperty;
      display : PLsmSvgDisplayProperty;
      fill : PLsmSvgPaintProperty;
      fill_opacity : PLsmSvgDoubleProperty;
      fill_rule : PLsmSvgFillRuleProperty;
      font : PLsmProperty;
      font_family : PLsmProperty;
      font_size : PLsmSvgLengthProperty;
      font_size_adjust : PLsmProperty;
      font_stretch : PLsmSvgFontStretchProperty;
      font_style : PLsmSvgFontStyleProperty;
      font_variant : PLsmProperty;
      font_weight : PLsmSvgFontWeightProperty;
      glyph_orientation_horizontal : PLsmProperty;
      glyph_orientation_vertical : PLsmProperty;
      image_rendering : PLsmProperty;
      kerning : PLsmProperty;
      letter_spacing : PLsmProperty;
      marker : PLsmProperty;
      marker_end : PLsmProperty;
      marker_mid : PLsmProperty;
      marker_start : PLsmProperty;
      pointer_events : PLsmProperty;
      shape_rendering : PLsmProperty;
      stroke : PLsmSvgPaintProperty;
      stroke_dash_array : PLsmSvgDashArrayProperty;
      stroke_dash_offset : PLsmSvgLengthProperty;
      stroke_line_cap : PLsmSvgLineCapProperty;
      stroke_line_join : PLsmSvgLineJoinProperty;
      stroke_miter_limit : PLsmSvgDoubleProperty;
      stroke_opacity : PLsmSvgDoubleProperty;
      stroke_width : PLsmSvgLengthProperty;
      text_anchor : PLsmSvgTextAnchorProperty;
      text_rendering : PLsmProperty;
      visibility : PLsmSvgVisibilityProperty;
      word_spacing : PLsmProperty;
      writing_mode : PLsmSvgWritingModeProperty;
      font_size_px : Tdouble;
      ignore_group_opacity : Tgboolean;
    end;


procedure lsm_svg_property_bag_set_property(property_bag:PLsmPropertyBag; name:Pchar; value:Pchar);cdecl;external liblasem;
function lsm_svg_property_bag_get_property(property_bag:PLsmPropertyBag; name:Pchar):Pchar;cdecl;external liblasem;
procedure lsm_svg_property_bag_clean(property_bag:PLsmPropertyBag);cdecl;external liblasem;
function lsm_svg_property_bag_serialize(property_bag:PLsmPropertyBag):Pchar;cdecl;external liblasem;
function lsm_svg_style_new:PLsmSvgStyle;cdecl;external liblasem;
function lsm_svg_style_ref(style:PLsmSvgStyle):PLsmSvgStyle;cdecl;external liblasem;
procedure lsm_svg_style_unref(style:PLsmSvgStyle);cdecl;external liblasem;
function lsm_svg_style_new_inherited(parent_style:PLsmSvgStyle; property_bag:PLsmPropertyBag):PLsmSvgStyle;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:11:19 ===


implementation



end.
