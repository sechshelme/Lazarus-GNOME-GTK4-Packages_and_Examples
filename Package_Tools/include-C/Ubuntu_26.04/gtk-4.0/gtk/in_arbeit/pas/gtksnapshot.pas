unit gtksnapshot;

interface

uses
  fp_glib2, fp_gtk4;

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

{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSnapshot, g_object_unref) }
function gtk_snapshot_get_type:TGType;cdecl;external libgtk4;
function gtk_snapshot_new:PGtkSnapshot;cdecl;external libgtk4;
function gtk_snapshot_free_to_node(snapshot:PGtkSnapshot):PGskRenderNode;cdecl;external libgtk4;
function gtk_snapshot_free_to_paintable(snapshot:PGtkSnapshot; size:Pgraphene_size_t):PGdkPaintable;cdecl;external libgtk4;
function gtk_snapshot_to_node(snapshot:PGtkSnapshot):PGskRenderNode;cdecl;external libgtk4;
function gtk_snapshot_to_paintable(snapshot:PGtkSnapshot; size:Pgraphene_size_t):PGdkPaintable;cdecl;external libgtk4;
procedure gtk_snapshot_push_debug(snapshot:PGtkSnapshot; message:Pchar; args:array of const);cdecl;external libgtk4;
procedure gtk_snapshot_push_debug(snapshot:PGtkSnapshot; message:Pchar);cdecl;external libgtk4;
{ (2, 3); }
procedure gtk_snapshot_push_opacity(snapshot:PGtkSnapshot; opacity:Tdouble);cdecl;external libgtk4;
procedure gtk_snapshot_push_isolation(snapshot:PGtkSnapshot; features:TGskIsolation);cdecl;external libgtk4;
procedure gtk_snapshot_push_blur(snapshot:PGtkSnapshot; radius:Tdouble);cdecl;external libgtk4;
procedure gtk_snapshot_push_color_matrix(snapshot:PGtkSnapshot; color_matrix:Pgraphene_matrix_t; color_offset:Pgraphene_vec4_t);cdecl;external libgtk4;
procedure gtk_snapshot_push_component_transfer(snapshot:PGtkSnapshot; red:PGskComponentTransfer; green:PGskComponentTransfer; blue:PGskComponentTransfer; alpha:PGskComponentTransfer);cdecl;external libgtk4;
procedure gtk_snapshot_push_repeat(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; child_bounds:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gtk_snapshot_push_clip(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gtk_snapshot_push_rounded_clip(snapshot:PGtkSnapshot; bounds:PGskRoundedRect);cdecl;external libgtk4;
procedure gtk_snapshot_push_fill(snapshot:PGtkSnapshot; path:PGskPath; fill_rule:TGskFillRule);cdecl;external libgtk4;
procedure gtk_snapshot_push_stroke(snapshot:PGtkSnapshot; path:PGskPath; stroke:PGskStroke);cdecl;external libgtk4;
procedure gtk_snapshot_push_shadow(snapshot:PGtkSnapshot; shadow:PGskShadow; n_shadows:Tgsize);cdecl;external libgtk4;
procedure gtk_snapshot_push_blend(snapshot:PGtkSnapshot; blend_mode:TGskBlendMode);cdecl;external libgtk4;
procedure gtk_snapshot_push_mask(snapshot:PGtkSnapshot; mask_mode:TGskMaskMode);cdecl;external libgtk4;
procedure gtk_snapshot_push_copy(snapshot:PGtkSnapshot);cdecl;external libgtk4;
procedure gtk_snapshot_push_composite(snapshot:PGtkSnapshot; op:TGskPorterDuff);cdecl;external libgtk4;
procedure gtk_snapshot_push_cross_fade(snapshot:PGtkSnapshot; progress:Tdouble);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gtk_snapshot_push_gl_shader(snapshot:PGtkSnapshot; shader:PGskGLShader; bounds:Pgraphene_rect_t; take_args:PGBytes);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
procedure gtk_snapshot_gl_shader_pop_texture(snapshot:PGtkSnapshot);cdecl;external libgtk4;
procedure gtk_snapshot_pop(snapshot:PGtkSnapshot);cdecl;external libgtk4;
procedure gtk_snapshot_save(snapshot:PGtkSnapshot);cdecl;external libgtk4;
procedure gtk_snapshot_restore(snapshot:PGtkSnapshot);cdecl;external libgtk4;
procedure gtk_snapshot_transform(snapshot:PGtkSnapshot; transform:PGskTransform);cdecl;external libgtk4;
procedure gtk_snapshot_transform_matrix(snapshot:PGtkSnapshot; matrix:Pgraphene_matrix_t);cdecl;external libgtk4;
procedure gtk_snapshot_translate(snapshot:PGtkSnapshot; point:Pgraphene_point_t);cdecl;external libgtk4;
procedure gtk_snapshot_translate_3d(snapshot:PGtkSnapshot; point:Pgraphene_point3d_t);cdecl;external libgtk4;
procedure gtk_snapshot_rotate(snapshot:PGtkSnapshot; angle:single);cdecl;external libgtk4;
procedure gtk_snapshot_rotate_3d(snapshot:PGtkSnapshot; angle:single; axis:Pgraphene_vec3_t);cdecl;external libgtk4;
procedure gtk_snapshot_scale(snapshot:PGtkSnapshot; factor_x:single; factor_y:single);cdecl;external libgtk4;
procedure gtk_snapshot_scale_3d(snapshot:PGtkSnapshot; factor_x:single; factor_y:single; factor_z:single);cdecl;external libgtk4;
procedure gtk_snapshot_perspective(snapshot:PGtkSnapshot; depth:single);cdecl;external libgtk4;
procedure gtk_snapshot_append_node(snapshot:PGtkSnapshot; node:PGskRenderNode);cdecl;external libgtk4;
function gtk_snapshot_append_cairo(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t):Pcairo_t;cdecl;external libgtk4;
procedure gtk_snapshot_append_texture(snapshot:PGtkSnapshot; texture:PGdkTexture; bounds:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gtk_snapshot_append_scaled_texture(snapshot:PGtkSnapshot; texture:PGdkTexture; filter:TGskScalingFilter; bounds:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gtk_snapshot_append_color(snapshot:PGtkSnapshot; color:PGdkRGBA; bounds:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gtk_snapshot_append_linear_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; start_point:Pgraphene_point_t; end_point:Pgraphene_point_t; stops:PGskColorStop; 
            n_stops:Tgsize);cdecl;external libgtk4;
procedure gtk_snapshot_append_repeating_linear_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; start_point:Pgraphene_point_t; end_point:Pgraphene_point_t; stops:PGskColorStop; 
            n_stops:Tgsize);cdecl;external libgtk4;
procedure gtk_snapshot_append_radial_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; center:Pgraphene_point_t; hradius:single; vradius:single; 
            start:single; end:single; stops:PGskColorStop; n_stops:Tgsize);cdecl;external libgtk4;
procedure gtk_snapshot_append_repeating_radial_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; center:Pgraphene_point_t; hradius:single; vradius:single; 
            start:single; end:single; stops:PGskColorStop; n_stops:Tgsize);cdecl;external libgtk4;
procedure gtk_snapshot_append_conic_gradient(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; center:Pgraphene_point_t; rotation:single; stops:PGskColorStop; 
            n_stops:Tgsize);cdecl;external libgtk4;
procedure gtk_snapshot_append_border(snapshot:PGtkSnapshot; outline:PGskRoundedRect; border_width:array[0..3] of single; border_color:array[0..3] of TGdkRGBA);cdecl;external libgtk4;
procedure gtk_snapshot_append_inset_shadow(snapshot:PGtkSnapshot; outline:PGskRoundedRect; color:PGdkRGBA; dx:single; dy:single; 
            spread:single; blur_radius:single);cdecl;external libgtk4;
procedure gtk_snapshot_append_outset_shadow(snapshot:PGtkSnapshot; outline:PGskRoundedRect; color:PGdkRGBA; dx:single; dy:single; 
            spread:single; blur_radius:single);cdecl;external libgtk4;
{ next function implemented in gskpango.c  }
procedure gtk_snapshot_append_layout(snapshot:PGtkSnapshot; layout:PPangoLayout; color:PGdkRGBA);cdecl;external libgtk4;
procedure gtk_snapshot_append_fill(snapshot:PGtkSnapshot; path:PGskPath; fill_rule:TGskFillRule; color:PGdkRGBA);cdecl;external libgtk4;
procedure gtk_snapshot_append_stroke(snapshot:PGtkSnapshot; path:PGskPath; stroke:PGskStroke; color:PGdkRGBA);cdecl;external libgtk4;
procedure gtk_snapshot_append_paste(snapshot:PGtkSnapshot; bounds:Pgraphene_rect_t; nth:Tgsize);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:19:24 ===

function GTK_TYPE_SNAPSHOT : TGType;
function GTK_SNAPSHOT(obj : Pointer) : PGtkSnapshot;
function GTK_IS_SNAPSHOT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SNAPSHOT : TGType;
  begin
    GTK_TYPE_SNAPSHOT:=gtk_snapshot_get_type;
  end;

function GTK_SNAPSHOT(obj : Pointer) : PGtkSnapshot;
begin
  Result := PGtkSnapshot(g_type_check_instance_cast(obj, GTK_TYPE_SNAPSHOT));
end;

function GTK_IS_SNAPSHOT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SNAPSHOT);
end;



end.
