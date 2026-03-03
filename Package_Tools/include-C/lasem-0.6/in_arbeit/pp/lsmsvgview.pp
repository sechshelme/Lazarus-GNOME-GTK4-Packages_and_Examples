
unit lsmsvgview;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgview.h
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
Pdword  = ^dword;
PGdkPixbuf  = ^GdkPixbuf;
PGList  = ^GList;
PGSList  = ^GSList;
PLsmBox  = ^LsmBox;
PLsmExtents  = ^LsmExtents;
PLsmSvgDocument  = ^LsmSvgDocument;
PLsmSvgElement  = ^LsmSvgElement;
PLsmSvgLength  = ^LsmSvgLength;
PLsmSvgLengthList  = ^LsmSvgLengthList;
PLsmSvgMatrix  = ^LsmSvgMatrix;
PLsmSvgPreserveAspectRatio  = ^LsmSvgPreserveAspectRatio;
PLsmSvgStyle  = ^LsmSvgStyle;
PLsmSvgView  = ^LsmSvgView;
PLsmSvgViewClass  = ^LsmSvgViewClass;
PLsmSvgViewPatternData  = ^LsmSvgViewPatternData;
PLsmSvgViewSurfaceType  = ^LsmSvgViewSurfaceType;
PPangoLayout  = ^PangoLayout;
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
{$ifndef LSM_SVG_VIEW_H}
{$define LSM_SVG_VIEW_H}
{$include <lsmdom.h>}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgelement.h>}
{$include <gdk-pixbuf/gdk-pixbuf.h>}
type
  PLsmSvgViewSurfaceType = ^TLsmSvgViewSurfaceType;
  TLsmSvgViewSurfaceType =  Longint;
  Const
    LSM_SVG_VIEW_SURFACE_TYPE_AUTO = 0;
    LSM_SVG_VIEW_SURFACE_TYPE_IMAGE = 1;
;

{ was #define dname def_expr }
function LSM_TYPE_SVG_VIEW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_VIEW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_VIEW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_VIEW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_VIEW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_VIEW_GET_CLASS(obj : longint) : longint;

type
(* Const before type ignored *)
  PLsmSvgView = ^TLsmSvgView;
  TLsmSvgView = record
      dom_view : TLsmDomView;
      resolution_ppi : Tdouble;
      style : PLsmSvgStyle;
      style_stack : PGSList;
      element_stack : PGSList;
      viewbox_stack : PGSList;
      matrix_stack : PGSList;
      pango_layout_stack : PGSList;
      background_stack : PGList;
      is_pango_layout_in_use : Tgboolean;
      pattern_data : PLsmSvgViewPatternData;
      pango_layout : PPangoLayout;
      pattern_stack : PGSList;
      is_clipping : Tgboolean;
      clip_extents : TLsmBox;
      last_stop_offset : Tdouble;
      filter_surfaces : PGSList;
      debug_filter : Tgboolean;
      debug_mask : Tgboolean;
      debug_pattern : Tgboolean;
      debug_group : Tgboolean;
      debug_text : Tgboolean;
    end;

  PLsmSvgViewClass = ^TLsmSvgViewClass;
  TLsmSvgViewClass = record
      parent_class : TLsmDomViewClass;
    end;


function lsm_svg_view_get_type:TGType;cdecl;external;
function lsm_svg_view_new(document:PLsmSvgDocument):PLsmSvgView;cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_normalize_length(view:PLsmSvgView; length:PLsmSvgLength; direction:TLsmSvgLengthDirection):Tdouble;cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_normalize_length_list(view:PLsmSvgView; list:PLsmSvgLengthList; direction:TLsmSvgLengthDirection; n_data:Pdword):Pdouble;cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_get_pattern_extents(view:PLsmSvgView):PLsmBox;cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_get_object_extents(view:PLsmSvgView):PLsmBox;cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_get_clip_extents(view:PLsmSvgView):PLsmBox;cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_path_extents(view:PLsmSvgView; path:Pchar; extents:PLsmExtents);cdecl;external;
procedure lsm_svg_view_create_radial_gradient(view:PLsmSvgView; cx:Tdouble; cy:Tdouble; r:Tdouble; fx:Tdouble; 
            fy:Tdouble);cdecl;external;
procedure lsm_svg_view_create_linear_gradient(view:PLsmSvgView; x1:Tdouble; y1:Tdouble; x2:Tdouble; y2:Tdouble);cdecl;external;
procedure lsm_svg_view_add_gradient_color_stop(view:PLsmSvgView; offset:Tdouble);cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_set_gradient_properties(view:PLsmSvgView; method:TLsmSvgSpreadMethod; units:TLsmSvgPatternUnits; matrix:PLsmSvgMatrix):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_svg_view_create_surface_pattern(view:PLsmSvgView; viewport:PLsmBox; matrix:PLsmSvgMatrix; surface_type:TLsmSvgViewSurfaceType):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_show_viewport(view:PLsmSvgView; viewport:PLsmBox);cdecl;external;
procedure lsm_svg_view_show_rectangle(view:PLsmSvgView; x:Tdouble; y:Tdouble; width:Tdouble; height:Tdouble; 
            rx:Tdouble; ry:Tdouble);cdecl;external;
procedure lsm_svg_view_show_circle(view:PLsmSvgView; cx:Tdouble; cy:Tdouble; r:Tdouble);cdecl;external;
procedure lsm_svg_view_show_ellipse(view:PLsmSvgView; cx:Tdouble; cy:Tdouble; rx:Tdouble; ry:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_show_path(view:PLsmSvgView; d:Pchar);cdecl;external;
procedure lsm_svg_view_show_line(view:PLsmSvgView; x1:Tdouble; y1:Tdouble; x2:Tdouble; y2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_show_polyline(view:PLsmSvgView; points:Pchar);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_show_polygon(view:PLsmSvgView; points:Pchar);cdecl;external;
procedure lsm_svg_view_start_text(view:PLsmSvgView);cdecl;external;
procedure lsm_svg_view_end_text(view:PLsmSvgView);cdecl;external;
(* Const before declarator ignored *)
procedure lsm_svg_view_show_text(view:PLsmSvgView; _string:Pchar; n_x:dword; x:Pdouble; n_y:dword; 
            y:Pdouble; n_dx:dword; dx:Pdouble; n_dy:dword; dy:Pdouble);cdecl;external;
(* Const before declarator ignored *)
procedure lsm_svg_view_text_extents(view:PLsmSvgView; _string:Pchar; x:Tdouble; y:Tdouble; n_dx:dword; 
            dx:Pdouble; n_dy:dword; dy:Pdouble; extents:PLsmExtents);cdecl;external;
procedure lsm_svg_view_show_pixbuf(view:PLsmSvgView; pixbuf:PGdkPixbuf);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_push_viewbox(view:PLsmSvgView; viewbox:PLsmBox);cdecl;external;
procedure lsm_svg_view_pop_viewbox(view:PLsmSvgView);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_push_viewport(view:PLsmSvgView; viewport:PLsmBox; viewbox:PLsmBox; aspect_ratio:PLsmSvgPreserveAspectRatio; overflow:TLsmSvgOverflow);cdecl;external;
procedure lsm_svg_view_pop_viewport(view:PLsmSvgView);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_viewbox_to_viewport(view:PLsmSvgView; viewport:PLsmBox; viewbox:PLsmBox; aspect_ratio:PLsmSvgPreserveAspectRatio; x:Pdouble; 
            y:Pdouble);cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_push_matrix(view:PLsmSvgView; matrix:PLsmSvgMatrix):Tgboolean;cdecl;external;
procedure lsm_svg_view_pop_matrix(view:PLsmSvgView);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_view_push_element(view:PLsmSvgView; element:PLsmSvgElement);cdecl;external;
procedure lsm_svg_view_pop_element(view:PLsmSvgView);cdecl;external;
function lsm_svg_view_get_referencing_element(view:PLsmSvgView):PLsmSvgElement;cdecl;external;
procedure lsm_svg_view_push_style(view:PLsmSvgView; style:PLsmSvgStyle);cdecl;external;
procedure lsm_svg_view_pop_style(view:PLsmSvgView);cdecl;external;
function lsm_svg_view_get_current_style(view:PLsmSvgView):PLsmSvgStyle;cdecl;external;
procedure lsm_svg_view_push_composition(view:PLsmSvgView; style:PLsmSvgStyle);cdecl;external;
procedure lsm_svg_view_pop_composition(view:PLsmSvgView);cdecl;external;
(* Const before type ignored *)
function lsm_svg_view_get_filter_surface_extents(view:PLsmSvgView; name:Pchar):TLsmBox;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_blend(view:PLsmSvgView; input_1:Pchar; input_2:Pchar; output:Pchar; subregion:PLsmBox; 
            mode:TLsmSvgBlendingMode);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_flood(view:PLsmSvgView; output:Pchar; subregion:PLsmBox);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_gaussian_blur(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox; std_x:Tdouble; 
            std_y:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_offset(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox; dx:Tdouble; 
            dy:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_color_matrix(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox; _type:TLsmSvgColorFilterType; 
            n_values:dword; values:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_displacement_map(view:PLsmSvgView; input_1:Pchar; input_2:Pchar; output:Pchar; subregion:PLsmBox; 
            scale:Tdouble; x_channel_selector:TLsmSvgChannelSelector; y_channel_selector:TLsmSvgChannelSelector);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_merge(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_tile(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_image(view:PLsmSvgView; output:Pchar; subregion:PLsmBox; pixbuf:PGdkPixbuf; preserve_aspect_ratio:TLsmSvgPreserveAspectRatio);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_morphology(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox; op:TLsmSvgMorphologyOperator; 
            radius:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_convolve_matrix(view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox; a:dword; 
            b:dword; n_values:dword; values:Pdouble; divisor:Tdouble; bias:Tdouble; 
            target_x:longint; target_y:longint; edge_mode:TLsmSvgEdgeMode; preserve_alpha:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_specular_lighting(view:PLsmSvgView; output:Pchar; subregion:PLsmBox; surface_scale:Tdouble; specular_constant:Tdouble; 
            specular_exponent:Tdouble; dx:Tdouble; dy:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_view_apply_turbulence(view:PLsmSvgView; output:Pchar; subregion:PLsmBox; base_frequency_x:Tdouble; base_frequency_y:Tdouble; 
            n_octaves:longint; seed:Tdouble; stitch_tiles:TLsmSvgStitchTiles; _type:TLsmSvgTurbulenceType);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_VIEW : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_VIEW:=lsm_svg_view_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_VIEW(obj : longint) : longint;
begin
  LSM_SVG_VIEW:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_VIEW,LsmSvgView);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_VIEW_CLASS(klass : longint) : longint;
begin
  LSM_SVG_VIEW_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_VIEW,LsmSvgViewClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_VIEW(obj : longint) : longint;
begin
  LSM_IS_SVG_VIEW:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_VIEW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_VIEW_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_VIEW_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_VIEW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_VIEW_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_VIEW_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_VIEW,LsmSvgViewClass);
end;


end.
