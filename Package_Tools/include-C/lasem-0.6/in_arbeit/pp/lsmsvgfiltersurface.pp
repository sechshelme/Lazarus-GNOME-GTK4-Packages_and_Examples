
unit lsmsvgfiltersurface;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgfiltersurface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgfiltersurface.h
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
Pcairo_matrix_t  = ^cairo_matrix_t;
Pcairo_surface_t  = ^cairo_surface_t;
Pchar  = ^char;
Pdouble  = ^double;
PGdkPixbuf  = ^GdkPixbuf;
PLsmBox  = ^LsmBox;
PLsmSvgFilterSurface  = ^LsmSvgFilterSurface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2012 Emmanuel Pacaud
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
{$ifndef LSM_SVG_FILTER_SURFACE_H}
{$define LSM_SVG_FILTER_SURFACE_H}
{$include <lsmtypes.h>}
{$include <lsmsvgtraits.h>}
{$include <cairo.h>}
{$include <gdk-pixbuf/gdk-pixbuf.h>}
type

{ was #define dname def_expr }
function LSM_TYPE_FILTER_SURFACE : longint; { return type might be wrong }

function lsm_svg_filter_surface_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_svg_filter_surface_new(name:Pchar; width:dword; height:dword; subregion:PLsmBox):PLsmSvgFilterSurface;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_svg_filter_surface_new_with_content(name:Pchar; surface:Pcairo_surface_t; subregion:PLsmBox):PLsmSvgFilterSurface;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_svg_filter_surface_new_similar(name:Pchar; model:PLsmSvgFilterSurface; subregion:PLsmBox):PLsmSvgFilterSurface;cdecl;external;
(* Const before type ignored *)
function lsm_svg_filter_surface_get_name(surface:PLsmSvgFilterSurface):Pchar;cdecl;external;
function lsm_svg_filter_surface_get_cairo_surface(surface:PLsmSvgFilterSurface):Pcairo_surface_t;cdecl;external;
(* Const before type ignored *)
function lsm_svg_filter_surface_get_subregion(surface:PLsmSvgFilterSurface):PLsmBox;cdecl;external;
procedure lsm_svg_filter_surface_unref(filter_surface:PLsmSvgFilterSurface);cdecl;external;
function lsm_svg_filter_surface_ref(filter_surface:PLsmSvgFilterSurface):PLsmSvgFilterSurface;cdecl;external;
procedure lsm_svg_filter_surface_alpha(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface);cdecl;external;
procedure lsm_svg_filter_surface_blend(input_1:PLsmSvgFilterSurface; input_2:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface; blending_mode:longint);cdecl;external;
procedure lsm_svg_filter_surface_blur(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface; sx:Tdouble; sy:Tdouble);cdecl;external;
procedure lsm_svg_filter_surface_flood(surface:PLsmSvgFilterSurface; red:Tdouble; green:Tdouble; blue:Tdouble; opacity:Tdouble);cdecl;external;
procedure lsm_svg_filter_surface_offset(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface; dx:longint; dy:longint);cdecl;external;
procedure lsm_svg_filter_surface_merge(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface);cdecl;external;
procedure lsm_svg_filter_surface_tile(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_filter_surface_color_matrix(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface; _type:TLsmSvgColorFilterType; n_values:dword; values:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_filter_surface_convolve_matrix(input:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface; x_order:dword; y_order:dword; n_values:dword; 
            values:Pdouble; divisor:Tdouble; bias:Tdouble; target_x:dword; target_y:dword; 
            edge_mode:TLsmSvgEdgeMode; preserve_alpha:Tgboolean);cdecl;external;
procedure lsm_svg_filter_surface_displacement_map(input_1:PLsmSvgFilterSurface; input_2:PLsmSvgFilterSurface; output:PLsmSvgFilterSurface; x_scale:Tdouble; y_scale:Tdouble; 
            x_channel_selector:TLsmSvgChannelSelector; y_channel_selector:TLsmSvgChannelSelector);cdecl;external;
procedure lsm_svg_filter_surface_image(output:PLsmSvgFilterSurface; pixbuf:PGdkPixbuf; preserve_aspect_ratio:TLsmSvgPreserveAspectRatio);cdecl;external;
procedure lsm_svg_filter_surface_morphology(input_surface:PLsmSvgFilterSurface; output_surface:PLsmSvgFilterSurface; op:TLsmSvgMorphologyOperator; rx:Tdouble; ry:Tdouble);cdecl;external;
procedure lsm_svg_filter_surface_specular_lighting(output_surface:PLsmSvgFilterSurface; surface_scale:Tdouble; specular_constant:Tdouble; specular_exponent:Tdouble; dx:Tdouble; 
            dy:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_filter_surface_turbulence(output_surface:PLsmSvgFilterSurface; base_frequency_x:Tdouble; base_frequency_y:Tdouble; n_octaves:longint; seed:Tdouble; 
            stitch_tiles:TLsmSvgStitchTiles; _type:TLsmSvgTurbulenceType; transform:Pcairo_matrix_t);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_FILTER_SURFACE : longint; { return type might be wrong }
  begin
    LSM_TYPE_FILTER_SURFACE:=lsm_svg_filter_surface_get_type;
  end;


end.
