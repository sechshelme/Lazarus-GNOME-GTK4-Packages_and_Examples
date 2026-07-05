unit gsktransform;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gskenums.h>}
{$include <gsk/gsktypes.h>}

function gsk_transform_get_type:TGType;cdecl;external libgtk4;
function gsk_transform_ref(self:PGskTransform):PGskTransform;cdecl;external libgtk4;
procedure gsk_transform_unref(self:PGskTransform);cdecl;external libgtk4;
procedure gsk_transform_print(self:PGskTransform; _string:PGString);cdecl;external libgtk4;
function gsk_transform_to_string(self:PGskTransform):Pchar;cdecl;external libgtk4;
function gsk_transform_parse(_string:Pchar; out_transform:PPGskTransform):Tgboolean;cdecl;external libgtk4;
procedure gsk_transform_to_matrix(self:PGskTransform; out_matrix:Pgraphene_matrix_t);cdecl;external libgtk4;
procedure gsk_transform_to_2d(self:PGskTransform; out_xx:Psingle; out_yx:Psingle; out_xy:Psingle; out_yy:Psingle; 
            out_dx:Psingle; out_dy:Psingle);cdecl;external libgtk4;
procedure gsk_transform_to_2d_components(self:PGskTransform; out_skew_x:Psingle; out_skew_y:Psingle; out_scale_x:Psingle; out_scale_y:Psingle; 
            out_angle:Psingle; out_dx:Psingle; out_dy:Psingle);cdecl;external libgtk4;
procedure gsk_transform_to_affine(self:PGskTransform; out_scale_x:Psingle; out_scale_y:Psingle; out_dx:Psingle; out_dy:Psingle);cdecl;external libgtk4;
procedure gsk_transform_to_translate(self:PGskTransform; out_dx:Psingle; out_dy:Psingle);cdecl;external libgtk4;
function gsk_transform_get_category(self:PGskTransform):TGskTransformCategory;cdecl;external libgtk4;
function gsk_transform_equal(first:PGskTransform; second:PGskTransform):Tgboolean;cdecl;external libgtk4;
function gsk_transform_new:PGskTransform;cdecl;external libgtk4;
function gsk_transform_transform(next:PGskTransform; other:PGskTransform):PGskTransform;cdecl;external libgtk4;
function gsk_transform_invert(self:PGskTransform):PGskTransform;cdecl;external libgtk4;
function gsk_transform_matrix(next:PGskTransform; matrix:Pgraphene_matrix_t):PGskTransform;cdecl;external libgtk4;
function gsk_transform_matrix_2d(next:PGskTransform; xx:single; yx:single; xy:single; yy:single; 
           dx:single; dy:single):PGskTransform;cdecl;external libgtk4;
function gsk_transform_translate(next:PGskTransform; point:Pgraphene_point_t):PGskTransform;cdecl;external libgtk4;
function gsk_transform_translate_3d(next:PGskTransform; point:Pgraphene_point3d_t):PGskTransform;cdecl;external libgtk4;
function gsk_transform_skew(next:PGskTransform; skew_x:single; skew_y:single):PGskTransform;cdecl;external libgtk4;
function gsk_transform_rotate(next:PGskTransform; angle:single):PGskTransform;cdecl;external libgtk4;
function gsk_transform_rotate_3d(next:PGskTransform; angle:single; axis:Pgraphene_vec3_t):PGskTransform;cdecl;external libgtk4;
function gsk_transform_scale(next:PGskTransform; factor_x:single; factor_y:single):PGskTransform;cdecl;external libgtk4;
function gsk_transform_scale_3d(next:PGskTransform; factor_x:single; factor_y:single; factor_z:single):PGskTransform;cdecl;external libgtk4;
function gsk_transform_perspective(next:PGskTransform; depth:single):PGskTransform;cdecl;external libgtk4;
procedure gsk_transform_transform_bounds(self:PGskTransform; rect:Pgraphene_rect_t; out_rect:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gsk_transform_transform_point(self:PGskTransform; point:Pgraphene_point_t; out_point:Pgraphene_point_t);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskTransform, gsk_transform_unref) }

// === Konventiert am: 5-7-26 13:38:51 ===

function GSK_TYPE_TRANSFORM : TGType;

implementation

function GSK_TYPE_TRANSFORM : TGType;
  begin
    GSK_TYPE_TRANSFORM:=gsk_transform_get_type;
  end;



end.
