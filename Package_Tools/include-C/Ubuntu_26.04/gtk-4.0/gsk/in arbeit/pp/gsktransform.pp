
unit gsktransform;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsktransform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsktransform.h
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
Pgraphene_matrix_t  = ^graphene_matrix_t;
Pgraphene_point3d_t  = ^graphene_point3d_t;
Pgraphene_point_t  = ^graphene_point_t;
Pgraphene_rect_t  = ^graphene_rect_t;
Pgraphene_vec3_t  = ^graphene_vec3_t;
PGskTransform  = ^GskTransform;
PGString  = ^GString;
Psingle  = ^single;
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

{ was #define dname def_expr }
function GSK_TYPE_TRANSFORM : longint; { return type might be wrong }

function gsk_transform_get_type:TGType;cdecl;external;
function gsk_transform_ref(self:PGskTransform):PGskTransform;cdecl;external;
procedure gsk_transform_unref(self:PGskTransform);cdecl;external;
procedure gsk_transform_print(self:PGskTransform; _string:PGString);cdecl;external;
function gsk_transform_to_string(self:PGskTransform):Pchar;cdecl;external;
(* Const before type ignored *)
function gsk_transform_parse(_string:Pchar; out_transform:PPGskTransform):Tgboolean;cdecl;external;
procedure gsk_transform_to_matrix(self:PGskTransform; out_matrix:Pgraphene_matrix_t);cdecl;external;
procedure gsk_transform_to_2d(self:PGskTransform; out_xx:Psingle; out_yx:Psingle; out_xy:Psingle; out_yy:Psingle; 
            out_dx:Psingle; out_dy:Psingle);cdecl;external;
procedure gsk_transform_to_2d_components(self:PGskTransform; out_skew_x:Psingle; out_skew_y:Psingle; out_scale_x:Psingle; out_scale_y:Psingle; 
            out_angle:Psingle; out_dx:Psingle; out_dy:Psingle);cdecl;external;
procedure gsk_transform_to_affine(self:PGskTransform; out_scale_x:Psingle; out_scale_y:Psingle; out_dx:Psingle; out_dy:Psingle);cdecl;external;
procedure gsk_transform_to_translate(self:PGskTransform; out_dx:Psingle; out_dy:Psingle);cdecl;external;
function gsk_transform_get_category(self:PGskTransform):TGskTransformCategory;cdecl;external;
function gsk_transform_equal(first:PGskTransform; second:PGskTransform):Tgboolean;cdecl;external;
function gsk_transform_new:PGskTransform;cdecl;external;
function gsk_transform_transform(next:PGskTransform; other:PGskTransform):PGskTransform;cdecl;external;
function gsk_transform_invert(self:PGskTransform):PGskTransform;cdecl;external;
(* Const before type ignored *)
function gsk_transform_matrix(next:PGskTransform; matrix:Pgraphene_matrix_t):PGskTransform;cdecl;external;
function gsk_transform_matrix_2d(next:PGskTransform; xx:single; yx:single; xy:single; yy:single; 
           dx:single; dy:single):PGskTransform;cdecl;external;
(* Const before type ignored *)
function gsk_transform_translate(next:PGskTransform; point:Pgraphene_point_t):PGskTransform;cdecl;external;
(* Const before type ignored *)
function gsk_transform_translate_3d(next:PGskTransform; point:Pgraphene_point3d_t):PGskTransform;cdecl;external;
function gsk_transform_skew(next:PGskTransform; skew_x:single; skew_y:single):PGskTransform;cdecl;external;
function gsk_transform_rotate(next:PGskTransform; angle:single):PGskTransform;cdecl;external;
(* Const before type ignored *)
function gsk_transform_rotate_3d(next:PGskTransform; angle:single; axis:Pgraphene_vec3_t):PGskTransform;cdecl;external;
function gsk_transform_scale(next:PGskTransform; factor_x:single; factor_y:single):PGskTransform;cdecl;external;
function gsk_transform_scale_3d(next:PGskTransform; factor_x:single; factor_y:single; factor_z:single):PGskTransform;cdecl;external;
function gsk_transform_perspective(next:PGskTransform; depth:single):PGskTransform;cdecl;external;
(* Const before type ignored *)
procedure gsk_transform_transform_bounds(self:PGskTransform; rect:Pgraphene_rect_t; out_rect:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
procedure gsk_transform_transform_point(self:PGskTransform; point:Pgraphene_point_t; out_point:Pgraphene_point_t);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskTransform, gsk_transform_unref) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_TRANSFORM : longint; { return type might be wrong }
  begin
    GSK_TYPE_TRANSFORM:=gsk_transform_get_type;
  end;


end.
