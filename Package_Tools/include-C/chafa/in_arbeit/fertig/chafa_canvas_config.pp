
unit chafa_canvas_config;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_canvas_config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_canvas_config.h
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
PChafaCanvasConfig  = ^ChafaCanvasConfig;
PChafaCanvasMode  = ^ChafaCanvasMode;
PChafaColorExtractor  = ^ChafaColorExtractor;
PChafaColorSpace  = ^ChafaColorSpace;
PChafaDitherMode  = ^ChafaDitherMode;
PChafaOptimizations  = ^ChafaOptimizations;
PChafaPassthrough  = ^ChafaPassthrough;
PChafaPixelMode  = ^ChafaPixelMode;
PChafaSymbolMap  = ^ChafaSymbolMap;
Pgint  = ^gint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2018-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_CANVAS_CONFIG_H__}
{$define __CHAFA_CANVAS_CONFIG_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{$include <chafa-symbol-map.h>}
{ Color extractor  }
type
  PChafaColorExtractor = ^TChafaColorExtractor;
  TChafaColorExtractor =  Longint;
  Const
    CHAFA_COLOR_EXTRACTOR_AVERAGE = 0;
    CHAFA_COLOR_EXTRACTOR_MEDIAN = 1;
    CHAFA_COLOR_EXTRACTOR_MAX = 2;
;
{ Color spaces  }
type
  PChafaColorSpace = ^TChafaColorSpace;
  TChafaColorSpace =  Longint;
  Const
    CHAFA_COLOR_SPACE_RGB = 0;
    CHAFA_COLOR_SPACE_DIN99D = 1;
    CHAFA_COLOR_SPACE_MAX = 2;
;
{ Canvas modes  }
type
  PChafaCanvasMode = ^TChafaCanvasMode;
  TChafaCanvasMode =  Longint;
  Const
    CHAFA_CANVAS_MODE_TRUECOLOR = 0;
    CHAFA_CANVAS_MODE_INDEXED_256 = 1;
    CHAFA_CANVAS_MODE_INDEXED_240 = 2;
    CHAFA_CANVAS_MODE_INDEXED_16 = 3;
    CHAFA_CANVAS_MODE_FGBG_BGFG = 4;
    CHAFA_CANVAS_MODE_FGBG = 5;
    CHAFA_CANVAS_MODE_INDEXED_8 = 6;
    CHAFA_CANVAS_MODE_INDEXED_16_8 = 7;
    CHAFA_CANVAS_MODE_MAX = 8;
;
{ Dither modes  }
type
  PChafaDitherMode = ^TChafaDitherMode;
  TChafaDitherMode =  Longint;
  Const
    CHAFA_DITHER_MODE_NONE = 0;
    CHAFA_DITHER_MODE_ORDERED = 1;
    CHAFA_DITHER_MODE_DIFFUSION = 2;
    CHAFA_DITHER_MODE_MAX = 3;
;
{ Pixel modes  }
type
  PChafaPixelMode = ^TChafaPixelMode;
  TChafaPixelMode =  Longint;
  Const
    CHAFA_PIXEL_MODE_SYMBOLS = 0;
    CHAFA_PIXEL_MODE_SIXELS = 1;
    CHAFA_PIXEL_MODE_KITTY = 2;
    CHAFA_PIXEL_MODE_ITERM2 = 3;
    CHAFA_PIXEL_MODE_MAX = 4;
;
{ Sequence optimization flags. When enabled, these may produce more compact
 * output at the cost of reduced compatibility and increased CPU use. Output
 * quality is unaffected.  }
type
  PChafaOptimizations = ^TChafaOptimizations;
  TChafaOptimizations =  Longint;
  Const
    CHAFA_OPTIMIZATION_REUSE_ATTRIBUTES = 1 shl 0;
    CHAFA_OPTIMIZATION_SKIP_CELLS = 1 shl 1;
    CHAFA_OPTIMIZATION_REPEAT_CELLS = 1 shl 2;
    CHAFA_OPTIMIZATION_NONE = 0;
    CHAFA_OPTIMIZATION_ALL = $7fffffff;
;
{ Passthrough modes  }
type
  PChafaPassthrough = ^TChafaPassthrough;
  TChafaPassthrough =  Longint;
  Const
    CHAFA_PASSTHROUGH_NONE = 0;
    CHAFA_PASSTHROUGH_SCREEN = 1;
    CHAFA_PASSTHROUGH_TMUX = 2;
    CHAFA_PASSTHROUGH_MAX = 3;
;
{ Canvas config  }
type

function chafa_canvas_config_new:PChafaCanvasConfig;cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_copy(config:PChafaCanvasConfig):PChafaCanvasConfig;cdecl;external;
procedure chafa_canvas_config_ref(config:PChafaCanvasConfig);cdecl;external;
procedure chafa_canvas_config_unref(config:PChafaCanvasConfig);cdecl;external;
(* Const before type ignored *)
procedure chafa_canvas_config_get_geometry(config:PChafaCanvasConfig; width_out:Pgint; height_out:Pgint);cdecl;external;
procedure chafa_canvas_config_set_geometry(config:PChafaCanvasConfig; width:Tgint; height:Tgint);cdecl;external;
(* Const before type ignored *)
procedure chafa_canvas_config_get_cell_geometry(config:PChafaCanvasConfig; cell_width_out:Pgint; cell_height_out:Pgint);cdecl;external;
procedure chafa_canvas_config_set_cell_geometry(config:PChafaCanvasConfig; cell_width:Tgint; cell_height:Tgint);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_canvas_mode(config:PChafaCanvasConfig):TChafaCanvasMode;cdecl;external;
procedure chafa_canvas_config_set_canvas_mode(config:PChafaCanvasConfig; mode:TChafaCanvasMode);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_color_extractor(config:PChafaCanvasConfig):TChafaColorExtractor;cdecl;external;
procedure chafa_canvas_config_set_color_extractor(config:PChafaCanvasConfig; color_extractor:TChafaColorExtractor);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_color_space(config:PChafaCanvasConfig):TChafaColorSpace;cdecl;external;
procedure chafa_canvas_config_set_color_space(config:PChafaCanvasConfig; color_space:TChafaColorSpace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function chafa_canvas_config_peek_symbol_map(config:PChafaCanvasConfig):PChafaSymbolMap;cdecl;external;
(* Const before type ignored *)
procedure chafa_canvas_config_set_symbol_map(config:PChafaCanvasConfig; symbol_map:PChafaSymbolMap);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function chafa_canvas_config_peek_fill_symbol_map(config:PChafaCanvasConfig):PChafaSymbolMap;cdecl;external;
(* Const before type ignored *)
procedure chafa_canvas_config_set_fill_symbol_map(config:PChafaCanvasConfig; fill_symbol_map:PChafaSymbolMap);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_transparency_threshold(config:PChafaCanvasConfig):Tgfloat;cdecl;external;
procedure chafa_canvas_config_set_transparency_threshold(config:PChafaCanvasConfig; alpha_threshold:Tgfloat);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_fg_color(config:PChafaCanvasConfig):Tguint32;cdecl;external;
procedure chafa_canvas_config_set_fg_color(config:PChafaCanvasConfig; fg_color_packed_rgb:Tguint32);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_bg_color(config:PChafaCanvasConfig):Tguint32;cdecl;external;
procedure chafa_canvas_config_set_bg_color(config:PChafaCanvasConfig; bg_color_packed_rgb:Tguint32);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_work_factor(config:PChafaCanvasConfig):Tgfloat;cdecl;external;
procedure chafa_canvas_config_set_work_factor(config:PChafaCanvasConfig; work_factor:Tgfloat);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_preprocessing_enabled(config:PChafaCanvasConfig):Tgboolean;cdecl;external;
procedure chafa_canvas_config_set_preprocessing_enabled(config:PChafaCanvasConfig; preprocessing_enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_dither_mode(config:PChafaCanvasConfig):TChafaDitherMode;cdecl;external;
procedure chafa_canvas_config_set_dither_mode(config:PChafaCanvasConfig; dither_mode:TChafaDitherMode);cdecl;external;
(* Const before type ignored *)
procedure chafa_canvas_config_get_dither_grain_size(config:PChafaCanvasConfig; width_out:Pgint; height_out:Pgint);cdecl;external;
procedure chafa_canvas_config_set_dither_grain_size(config:PChafaCanvasConfig; width:Tgint; height:Tgint);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_dither_intensity(config:PChafaCanvasConfig):Tgfloat;cdecl;external;
procedure chafa_canvas_config_set_dither_intensity(config:PChafaCanvasConfig; intensity:Tgfloat);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_pixel_mode(config:PChafaCanvasConfig):TChafaPixelMode;cdecl;external;
procedure chafa_canvas_config_set_pixel_mode(config:PChafaCanvasConfig; pixel_mode:TChafaPixelMode);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_optimizations(config:PChafaCanvasConfig):TChafaOptimizations;cdecl;external;
procedure chafa_canvas_config_set_optimizations(config:PChafaCanvasConfig; optimizations:TChafaOptimizations);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_fg_only_enabled(config:PChafaCanvasConfig):Tgboolean;cdecl;external;
procedure chafa_canvas_config_set_fg_only_enabled(config:PChafaCanvasConfig; fg_only_enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_config_get_passthrough(config:PChafaCanvasConfig):TChafaPassthrough;cdecl;external;
procedure chafa_canvas_config_set_passthrough(config:PChafaCanvasConfig; passthrough:TChafaPassthrough);cdecl;external;
{$endif}
{ __CHAFA_CANVAS_CONFIG_H__  }

implementation


end.
