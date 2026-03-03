
unit lsmsvgmatrix;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgmatrix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgmatrix.h
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
Pdouble  = ^double;
PLsmSvgMatrix  = ^LsmSvgMatrix;
PLsmSvgMatrixFlags  = ^LsmSvgMatrixFlags;
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
{$ifndef LSM_SVG_MATRIX_H}
{$define LSM_SVG_MATRIX_H}
{$include <lsmsvgtypes.h>}
type
  PLsmSvgMatrixFlags = ^TLsmSvgMatrixFlags;
  TLsmSvgMatrixFlags =  Longint;
  Const
    LSM_SVG_MATRIX_FLAGS_IDENTITY = 1 shl 0;
;
type
  PLsmSvgMatrix = ^TLsmSvgMatrix;
  TLsmSvgMatrix = record
      a : Tdouble;
      b : Tdouble;
      c : Tdouble;
      d : Tdouble;
      e : Tdouble;
      f : Tdouble;
      flags : TLsmSvgMatrixFlags;
    end;
(* Const before type ignored *)

function lsm_svg_matrix_is_identity(matrix:PLsmSvgMatrix):Tgboolean;cdecl;external;
(* Const before type ignored *)
function lsm_svg_matrix_is_invertible(matrix:PLsmSvgMatrix):Tgboolean;cdecl;external;
procedure lsm_svg_matrix_init(matrix:PLsmSvgMatrix; a:Tdouble; b:Tdouble; c:Tdouble; d:Tdouble; 
            e:Tdouble; f:Tdouble);cdecl;external;
procedure lsm_svg_matrix_init_identity(matrix:PLsmSvgMatrix);cdecl;external;
procedure lsm_svg_matrix_init_scale(matrix:PLsmSvgMatrix; sx:Tdouble; sy:Tdouble);cdecl;external;
procedure lsm_svg_matrix_scale(matrix:PLsmSvgMatrix; sx:Tdouble; sy:Tdouble);cdecl;external;
procedure lsm_svg_matrix_init_translate(matrix:PLsmSvgMatrix; tx:Tdouble; ty:Tdouble);cdecl;external;
procedure lsm_svg_matrix_translate(matrix:PLsmSvgMatrix; tx:Tdouble; ty:Tdouble);cdecl;external;
procedure lsm_svg_matrix_init_rotate(matrix:PLsmSvgMatrix; radians:Tdouble);cdecl;external;
procedure lsm_svg_matrix_rotate(matrix:PLsmSvgMatrix; radians:Tdouble);cdecl;external;
procedure lsm_svg_matrix_init_skew_x(matrix:PLsmSvgMatrix; radians:Tdouble);cdecl;external;
procedure lsm_svg_matrix_skew_x(matrix:PLsmSvgMatrix; radians:Tdouble);cdecl;external;
procedure lsm_svg_matrix_init_skew_y(matrix:PLsmSvgMatrix; radians:Tdouble);cdecl;external;
procedure lsm_svg_matrix_skew_y(matrix:PLsmSvgMatrix; radians:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure lsm_svg_matrix_multiply(result:PLsmSvgMatrix; a:PLsmSvgMatrix; b:PLsmSvgMatrix);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_matrix_transform_point(matrix:PLsmSvgMatrix; x:Pdouble; y:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_svg_matrix_transform_bounding_box(matrix:PLsmSvgMatrix; x1:Pdouble; y1:Pdouble; x2:Pdouble; y2:Pdouble);cdecl;external;
{$endif}

implementation


end.
