
unit pango_matrix;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_matrix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_matrix.h
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
PPangoMatrix  = ^PangoMatrix;
PPangoRectangle  = ^PangoRectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-matrix.h: Matrix manipulation routines
 *
 * Copyright (C) 2002, 2006 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_MATRIX_H__}
{$define __PANGO_MATRIX_H__}
{$include <glib.h>}
{$include <glib-object.h>}
type
{*
 * PangoMatrix:
 * @xx: 1st component of the transformation matrix
 * @xy: 2nd component of the transformation matrix
 * @yx: 3rd component of the transformation matrix
 * @yy: 4th component of the transformation matrix
 * @x0: x translation
 * @y0: y translation
 *
 * A `PangoMatrix` specifies a transformation between user-space
 * and device coordinates.
 *
 * The transformation is given by
 *
 * ```
 * x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
 * y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
 * ```
 *
 * Since: 1.6
  }
  PPangoMatrix = ^TPangoMatrix;
  TPangoMatrix = record
      xx : Tdouble;
      xy : Tdouble;
      yx : Tdouble;
      yy : Tdouble;
      x0 : Tdouble;
      y0 : Tdouble;
    end;


{ was #define dname def_expr }
function PANGO_TYPE_MATRIX : longint; { return type might be wrong }

{*
 * PANGO_MATRIX_INIT:
 *
 * Constant that can be used to initialize a `PangoMatrix` to
 * the identity transform.
 *
 * ```
 * PangoMatrix matrix = PANGO_MATRIX_INIT;
 * pango_matrix_rotate (&matrix, 45.);
 * ```
 *
 * Since: 1.6
 * }
{ xxxxxxxxxxxxxxxxxxxxxxxxx #define PANGO_MATRIX_INIT  1., 0., 0., 1., 0., 0.  }
{ for PangoRectangle  }
{$include <pango/pango-types.h>}

function pango_matrix_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function pango_matrix_copy(matrix:PPangoMatrix):PPangoMatrix;cdecl;external;
procedure pango_matrix_free(matrix:PPangoMatrix);cdecl;external;
procedure pango_matrix_translate(matrix:PPangoMatrix; tx:Tdouble; ty:Tdouble);cdecl;external;
procedure pango_matrix_scale(matrix:PPangoMatrix; scale_x:Tdouble; scale_y:Tdouble);cdecl;external;
procedure pango_matrix_rotate(matrix:PPangoMatrix; degrees:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure pango_matrix_concat(matrix:PPangoMatrix; new_matrix:PPangoMatrix);cdecl;external;
(* Const before type ignored *)
procedure pango_matrix_transform_point(matrix:PPangoMatrix; x:Pdouble; y:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure pango_matrix_transform_distance(matrix:PPangoMatrix; dx:Pdouble; dy:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure pango_matrix_transform_rectangle(matrix:PPangoMatrix; rect:PPangoRectangle);cdecl;external;
(* Const before type ignored *)
procedure pango_matrix_transform_pixel_rectangle(matrix:PPangoMatrix; rect:PPangoRectangle);cdecl;external;
(* Const before type ignored *)
function pango_matrix_get_font_scale_factor(matrix:PPangoMatrix):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure pango_matrix_get_font_scale_factors(matrix:PPangoMatrix; xscale:Pdouble; yscale:Pdouble);cdecl;external;
(* Const before type ignored *)
function pango_matrix_get_slant_ratio(matrix:PPangoMatrix):Tdouble;cdecl;external;
{$endif}
{ __PANGO_MATRIX_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_MATRIX : longint; { return type might be wrong }
  begin
    PANGO_TYPE_MATRIX:=pango_matrix_get_type;
  end;


end.
