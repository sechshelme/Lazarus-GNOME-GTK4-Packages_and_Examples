
unit gegl_matrix;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_matrix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_matrix.h
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
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
PGeglMatrix3  = ^GeglMatrix3;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2006-2018 GEGL developers
  }
{$ifndef __GEGL_MATRIX_H__}
{$define __GEGL_MATRIX_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gegl-buffer-matrix2.h>}
{**
 * GeglMatrix3:
 *
 * #GeglMatrix3 is a 3x3 matrix for GEGL.
 * Matrixes are currently used by #GeglPath and the affine operations,
 * they might be used more centrally in the core of GEGL later.
 *
  }
type
  PGeglMatrix3 = ^TGeglMatrix3;
  TGeglMatrix3 = record
      coeff : array[0..2] of array[0..2] of Tgdouble;
    end;

{ was #define dname def_expr }
function GEGL_TYPE_MATRIX3 : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_VALUE_HOLDS_MATRIX3(obj : longint) : longint;

{*
 * gegl_matrix3_get_type:
 *
 * Returns: the #GType for GeglMatrix3 objects
 *
 * }
function gegl_matrix3_get_type:TGType;cdecl;external;
{*
 * gegl_matrix3_new:
 *
 * Return: A newly allocated #GeglMatrix3
  }
function gegl_matrix3_new:PGeglMatrix3;cdecl;external;
{*
 * gegl_matrix3_identity:
 * @matrix: a #GeglMatrix3
 *
 * Set the provided @matrix to the identity matrix.
  }
procedure gegl_matrix3_identity(matrix:PGeglMatrix3);cdecl;external;
{*
 * gegl_matrix3_round_error:
 * @matrix: a #GeglMatrix3
 *
 * Rounds numerical errors in @matrix to the nearest integer.
  }
procedure gegl_matrix3_round_error(matrix:PGeglMatrix3);cdecl;external;
{*
 * gegl_matrix3_equal:
 * @matrix1: a #GeglMatrix3
 * @matrix2: a #GeglMatrix3
 *
 * Check if two matrices are equal.
 *
 * Returns TRUE if the matrices are equal.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_matrix3_equal(matrix1:PGeglMatrix3; matrix2:PGeglMatrix3):Tgboolean;cdecl;external;
{*
 * gegl_matrix3_is_identity:
 * @matrix: a #GeglMatrix3
 *
 * Check if a matrix is the identity matrix.
 *
 * Returns TRUE if the matrix is the identity matrix.
  }
(* Const before type ignored *)
function gegl_matrix3_is_identity(matrix:PGeglMatrix3):Tgboolean;cdecl;external;
{*
 * gegl_matrix3_is_scale:
 * @matrix: a #GeglMatrix3
 *
 * Check if a matrix only does scaling.
 *
 * Returns TRUE if the matrix only does scaling.
  }
(* Const before type ignored *)
function gegl_matrix3_is_scale(matrix:PGeglMatrix3):Tgboolean;cdecl;external;
{*
 * gegl_matrix3_is_translate:
 * @matrix: a #GeglMatrix3
 *
 * Check if a matrix only does translation.
 *
 * Returns TRUE if the matrix only does trasnlation.
  }
(* Const before type ignored *)
function gegl_matrix3_is_translate(matrix:PGeglMatrix3):Tgboolean;cdecl;external;
{*
 * gegl_matrix3_is_affine:
 * @matrix: a #GeglMatrix3
 *
 * Check if a matrix only does an affine transformation.
 *
 * Returns TRUE if the matrix only does an affine transformation.
  }
(* Const before type ignored *)
function gegl_matrix3_is_affine(matrix:PGeglMatrix3):Tgboolean;cdecl;external;
{*
 * gegl_matrix3_copy_into:
 * @dst: a #GeglMatrix3
 * @src: a #GeglMatrix3
 *
 * Copies the matrix in @src into @dst.
  }
(* Const before type ignored *)
procedure gegl_matrix3_copy_into(dst:PGeglMatrix3; src:PGeglMatrix3);cdecl;external;
{*
 * gegl_matrix3_copy:
 * @matrix: a #GeglMatrix3
 *
 * Returns a copy of @src.
  }
(* Const before type ignored *)
function gegl_matrix3_copy(matrix:PGeglMatrix3):PGeglMatrix3;cdecl;external;
{*
 * gegl_matrix3_determinant:
 * @matrix: a #GeglMatrix3
 *
 * Returns the determinant for the matrix.
  }
(* Const before type ignored *)
function gegl_matrix3_determinant(matrix:PGeglMatrix3):Tgdouble;cdecl;external;
{*
 * gegl_matrix3_invert:
 * @matrix: a #GeglMatrix3
 *
 * Inverts @matrix.
  }
procedure gegl_matrix3_invert(matrix:PGeglMatrix3);cdecl;external;
{*
 * gegl_matrix3_multiply:
 * @left: a #GeglMatrix3
 * @right: a #GeglMatrix3
 * @product: a #GeglMatrix3 to store the result in.
 *
 * Multiples @product = @left · @right
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gegl_matrix3_multiply(left:PGeglMatrix3; right:PGeglMatrix3; product:PGeglMatrix3);cdecl;external;
{*
 * gegl_matrix3_originate:
 * @matrix: a #GeglMatrix3
 * @x: x coordinate of new origin
 * @y: y coordinate of new origin.
 *
 * Shift the origin of the transformation specified by @matrix
 * to (@x, @y). In other words, calculate the matrix that:
 *
 * 1. Translates the input by (-@x, -@y).
 *
 * 2. Transforms the result using the original @matrix.
 *
 * 3. Translates the result by (@x, @y).
 *
  }
procedure gegl_matrix3_originate(matrix:PGeglMatrix3; x:Tgdouble; y:Tgdouble);cdecl;external;
{*
 * gegl_matrix3_transform_point:
 * @matrix: a #GeglMatrix3
 * @x: pointer to an x coordinate
 * @y: pointer to an y coordinate
 *
 * transforms the coordinates provided in @x and @y and changes to the
 * coordinates gotten when the transformed with the matrix.
 *
  }
(* Const before type ignored *)
procedure gegl_matrix3_transform_point(matrix:PGeglMatrix3; x:Pgdouble; y:Pgdouble);cdecl;external;
{*
 * gegl_matrix3_parse_string:
 * @matrix: a #GeglMatrix3
 * @string: a string describing the matrix (right now a small subset of the
 * transform strings allowed by SVG)
 *
 * Parse a transofmation matrix from a string.
  }
(* Const before type ignored *)
procedure gegl_matrix3_parse_string(matrix:PGeglMatrix3; _string:Pgchar);cdecl;external;
{*
 * gegl_matrix3_to_string:
 * @matrix: a #GeglMatrix3
 *
 * Serialize a #GeglMatrix3 to a string.
 *
 * Returns a freshly allocated string representing that #GeglMatrix3, the
 * returned string should be g_free()'d.
 *
  }
(* Const before type ignored *)
function gegl_matrix3_to_string(matrix:PGeglMatrix3):Pgchar;cdecl;external;
{**
  }
{$endif}

implementation

{ was #define dname def_expr }
function GEGL_TYPE_MATRIX3 : longint; { return type might be wrong }
  begin
    GEGL_TYPE_MATRIX3:=gegl_matrix3_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_VALUE_HOLDS_MATRIX3(obj : longint) : longint;
begin
  GEGL_VALUE_HOLDS_MATRIX3:=G_TYPE_CHECK_VALUE_TYPE(value,GEGL_TYPE_MATRIX3);
end;


end.
