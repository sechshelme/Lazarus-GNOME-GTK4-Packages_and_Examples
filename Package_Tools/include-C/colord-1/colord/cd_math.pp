
unit cd_math;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_math.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_math.h
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
PCdMat3x3  = ^CdMat3x3;
PCdVec3  = ^CdVec3;
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2012 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef __CD_MATH_H__}
{$define __CD_MATH_H__}
{$define __CD_MATH_H_INSIDE__}
{ any addition fields go *after* the data  }
type
  PCdMat3x3 = ^TCdMat3x3;
  TCdMat3x3 = record
      m00 : Tgdouble;
      m01 : Tgdouble;
      m02 : Tgdouble;
      m10 : Tgdouble;
      m11 : Tgdouble;
      m12 : Tgdouble;
      m20 : Tgdouble;
      m21 : Tgdouble;
      m22 : Tgdouble;
    end;
{ any addition fields go *after* the data  }

  PCdVec3 = ^TCdVec3;
  TCdVec3 = record
      v0 : Tdouble;
      v1 : Tdouble;
      v2 : Tdouble;
    end;

procedure cd_vec3_clear(src:PCdVec3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_vec3_add(src1:PCdVec3; src2:PCdVec3; dest:PCdVec3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_vec3_subtract(src1:PCdVec3; src2:PCdVec3; dest:PCdVec3);cdecl;external;
(* Const before type ignored *)
procedure cd_vec3_scalar_multiply(src:PCdVec3; value:Tgdouble; dest:PCdVec3);cdecl;external;
(* Const before type ignored *)
procedure cd_vec3_copy(src:PCdVec3; dest:PCdVec3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_vec3_squared_error(src1:PCdVec3; src2:PCdVec3):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_vec3_to_string(src:PCdVec3):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_vec3_get_data(src:PCdVec3):Pgdouble;cdecl;external;
procedure cd_vec3_init(dest:PCdVec3; v0:Tgdouble; v1:Tgdouble; v2:Tgdouble);cdecl;external;
procedure cd_mat33_init(dest:PCdMat3x3; m00:Tgdouble; m01:Tgdouble; m02:Tgdouble; m10:Tgdouble; 
            m11:Tgdouble; m12:Tgdouble; m20:Tgdouble; m21:Tgdouble; m22:Tgdouble);cdecl;external;
(* Const before type ignored *)
procedure cd_mat33_clear(src:PCdMat3x3);cdecl;external;
(* Const before type ignored *)
function cd_mat33_to_string(src:PCdMat3x3):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_mat33_get_data(src:PCdMat3x3):Pgdouble;cdecl;external;
procedure cd_mat33_set_identity(src:PCdMat3x3);cdecl;external;
(* Const before type ignored *)
procedure cd_mat33_scalar_multiply(mat_src:PCdMat3x3; value:Tgdouble; mat_dest:PCdMat3x3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_mat33_vector_multiply(mat_src:PCdMat3x3; vec_src:PCdVec3; vec_dest:PCdVec3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_mat33_matrix_multiply(mat_src1:PCdMat3x3; mat_src2:PCdMat3x3; mat_dest:PCdMat3x3);cdecl;external;
(* Const before type ignored *)
function cd_mat33_reciprocal(src:PCdMat3x3; dest:PCdMat3x3):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_mat33_determinant(src:PCdMat3x3):Tgdouble;cdecl;external;
(* Const before type ignored *)
procedure cd_mat33_normalize(src:PCdMat3x3; dest:PCdMat3x3);cdecl;external;
(* Const before type ignored *)
procedure cd_mat33_copy(src:PCdMat3x3; dest:PCdMat3x3);cdecl;external;
(* Const before type ignored *)
function cd_mat33_is_finite(mat:PCdMat3x3; error:PPGError):Tgboolean;cdecl;external;
{$undef __CD_MATH_H_INSIDE__}
{$endif}
{ __CD_MATH_H__  }

implementation


end.
