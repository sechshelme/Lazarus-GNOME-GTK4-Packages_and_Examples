
unit gtksnapshot;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksnapshot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksnapshot.h
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
Pcairo_t  = ^cairo_t;
Pchar  = ^char;
PGBytes  = ^GBytes;
PGdkPaintable  = ^GdkPaintable;
PGdkRGBA  = ^GdkRGBA;
PGdkTexture  = ^GdkTexture;
Pgraphene_matrix_t  = ^graphene_matrix_t;
Pgraphene_point3d_t  = ^graphene_point3d_t;
Pgraphene_point_t  = ^graphene_point_t;
Pgraphene_rect_t  = ^graphene_rect_t;
Pgraphene_size_t  = ^graphene_size_t;
Pgraphene_vec3_t  = ^graphene_vec3_t;
Pgraphene_vec4_t  = ^graphene_vec4_t;
PGskColorStop  = ^GskColorStop;
PGskComponentTransfer  = ^GskComponentTransfer;
PGskGLShader  = ^GskGLShader;
PGskPath  = ^GskPath;
PGskRenderNode  = ^GskRenderNode;
PGskRoundedRect  = ^GskRoundedRect;
PGskShadow  = ^GskShadow;
PGskStroke  = ^GskStroke;
PGskTransform  = ^GskTransform;
PGtkSnapshot  = ^GtkSnapshot;
PPangoLayout  = ^PangoLayout;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2016 Benjamin Otte <otte@gnome.org>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gsk/gsk.h>}
{$include <gtk/gtktypes.h>}
type

{ was #define dname def_expr }
function GTK_TYPE_SNAPSHOT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SNAPSHOT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SNAPSHOT(obj : longint) : longint;

{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSnapshot, g_object_unref) }
function gtk_snapshot_get_type:TGType;cdecl;external;
function gtk_snapshot_new:PGtkSnapshot;cdecl;external;
function gtk_snapshot_free_to_node(snapshot:PGtkSnapshot):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
function gtk_snapshot_free_to_paintable(snapshot:PGtkSnapshot; size:Pgraphene_size_t):PGdkPaintable;cdecl;external;
function gtk_snapshot_to_node(snapshot:PGtkSnapshot):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
function gtk_snapshot_to_paintable(snapshot:PGtkSnapshot; size:Pgraphene_size_t):PGdkPaintable;cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_push_debug(snapshot:PGtkSnapshot; message:Pchar; args:array of const);cdecl;external;
procedure gtk_snapshot_push_debug(snapshot:PGtkSnapshot; message:Pchar);cdecl;external;
{ (2, 3); }
procedure gtk_snapshot_push_opacity(snapshot:PGtkSnapshot; opacity:Tdouble);cdecl;external;
procedure gtk_snapshot_push_isolation(snapshot:PGtkSnapshot; features:TGskIsolation);cdecl;external;
procedure gtk_snapshot_push_blur(snapshot:PGtkSnapshot; radius:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_push_color_matrix(snapshot:PGtkSnapshot; color_matrix:Pgraphene_matrix_t; color_offset:Pgraphene_vec4_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_push_component_transfer(snapshot:PGtkSnapshot; red:PGskComponentTransfer; green:PGskComponentTransfer; blue:PGskComponentTransfer; alpha:PGskComponentTransfer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_push_repeat(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; child_bounds:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_push_clip(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_push_rounded_clip(snapshot:PGtkSnapshot; bounds:PGskRoundedRect);cdecl;external;
procedure gtk_snapshot_push_fill(snapshot:PGtkSnapshot; path:PGskPath; fill_rule:TGskFillRule);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_push_stroke(snapshot:PGtkSnapshot; path:PGskPath; stroke:PGskStroke);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_push_shadow(snapshot:PGtkSnapshot; shadow:PGskShadow; n_shadows:Tgsize);cdecl;external;
procedure gtk_snapshot_push_blend(snapshot:PGtkSnapshot; blend_mode:TGskBlendMode);cdecl;external;
procedure gtk_snapshot_push_mask(snapshot:PGtkSnapshot; mask_mode:TGskMaskMode);cdecl;external;
procedure gtk_snapshot_push_copy(snapshot:PGtkSnapshot);cdecl;external;
procedure gtk_snapshot_push_composite(snapshot:PGtkSnapshot; op:TGskPorterDuff);cdecl;external;
procedure gtk_snapshot_push_cross_fade(snapshot:PGtkSnapshot; progress:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
(* Const before type ignored *)
procedure gtk_snapshot_push_gl_shader(snapshot:PGtkSnapshot; shader:PGskGLShader; bounds:Pgraphene_rect_t; take_args:PGBytes);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gtk_snapshot_gl_shader_pop_texture(snapshot:PGtkSnapshot);cdecl;external;
procedure gtk_snapshot_pop(snapshot:PGtkSnapshot);cdecl;external;
procedure gtk_snapshot_save(snapshot:PGtkSnapshot);cdecl;external;
procedure gtk_snapshot_restore(snapshot:PGtkSnapshot);cdecl;external;
procedure gtk_snapshot_transform(snapshot:PGtkSnapshot; transform:PGskTransform);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_transform_matrix(snapshot:PGtkSnapshot; matrix:Pgraphene_matrix_t);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_translate(snapshot:PGtkSnapshot; point:Pgraphene_point_t);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_translate_3d(snapshot:PGtkSnapshot; point:Pgraphene_point3d_t);cdecl;external;
procedure gtk_snapshot_rotate(snapshot:PGtkSnapshot; angle:single);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_rotate_3d(snapshot:PGtkSnapshot; angle:single; axis:Pgraphene_vec3_t);cdecl;external;
procedure gtk_snapshot_scale(snapshot:PGtkSnapshot; factor_x:single; factor_y:single);cdecl;external;
procedure gtk_snapshot_scale_3d(snapshot:PGtkSnapshot; factor_x:single; factor_y:single; factor_z:single);cdecl;external;
procedure gtk_snapshot_perspective(snapshot:PGtkSnapshot; depth:single);cdecl;external;
procedure gtk_snapshot_append_node(snapshot:PGtkSnapshot; node:PGskRenderNode);cdecl;external;
(* Const before type ignored *)
function gtk_snapshot_append_cairo(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t):Pcairo_t;cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_append_texture(snapshot:PGtkSnapshot; texture:PGdkTexture; bounds:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_append_scaled_texture(snapshot:PGtkSnapshot; texture:PGdkTexture; filter:TGskScalingFilter; bounds:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_color(snapshot:PGtkSnapshot; color:PGdkRGBA; bounds:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_linear_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; start_point:Pgraphene_point_t; end_point:Pgraphene_point_t; stops:PGskColorStop; 
            n_stops:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_repeating_linear_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; start_point:Pgraphene_point_t; end_point:Pgraphene_point_t; stops:PGskColorStop; 
            n_stops:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_radial_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; center:Pgraphene_point_t; hradius:single; vradius:single; 
            start:single; end:single; stops:PGskColorStop; n_stops:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_repeating_radial_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; center:Pgraphene_point_t; hradius:single; vradius:single; 
            start:single; end:single; stops:PGskColorStop; n_stops:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_conic_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; center:Pgraphene_point_t; rotation:single; stops:PGskColorStop; 
            n_stops:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_border(snapshot:PGtkSnapshot; outline:PGskRoundedRect; border_width:array[0..3] of single; border_color:array[0..3] of TGdkRGBA);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_inset_shadow(snapshot:PGtkSnapshot; outline:PGskRoundedRect; color:PGdkRGBA; dx:single; dy:single; 
            spread:single; blur_radius:single);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_outset_shadow(snapshot:PGtkSnapshot; outline:PGskRoundedRect; color:PGdkRGBA; dx:single; dy:single; 
            spread:single; blur_radius:single);cdecl;external;
{ next function implemented in gskpango.c  }
(* Const before type ignored *)
procedure gtk_snapshot_append_layout(snapshot:PGtkSnapshot; layout:PPangoLayout; color:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_append_fill(snapshot:PGtkSnapshot; path:PGskPath; fill_rule:TGskFillRule; color:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_snapshot_append_stroke(snapshot:PGtkSnapshot; path:PGskPath; stroke:PGskStroke; color:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure gtk_snapshot_append_paste(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; nth:Tgsize);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SNAPSHOT : longint; { return type might be wrong }
  begin
    GTK_TYPE_SNAPSHOT:=gtk_snapshot_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SNAPSHOT(obj : longint) : longint;
begin
  GTK_SNAPSHOT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_SNAPSHOT,GtkSnapshot);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SNAPSHOT(obj : longint) : longint;
begin
  GTK_IS_SNAPSHOT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_SNAPSHOT);
end;


end.
