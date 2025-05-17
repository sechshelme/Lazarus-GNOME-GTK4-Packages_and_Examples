
unit eina_quaternion;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_quaternion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_quaternion.h
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
PEina_Matrix3  = ^Eina_Matrix3;
PEina_Matrix3_F16p16  = ^Eina_Matrix3_F16p16;
PEina_Matrix4  = ^Eina_Matrix4;
PEina_Point_3D  = ^Eina_Point_3D;
PEina_Point_3D_F16p16  = ^Eina_Point_3D_F16p16;
PEina_Quaternion  = ^Eina_Quaternion;
PEina_Quaternion_F16p16  = ^Eina_Quaternion_F16p16;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2015 Cedric Bail
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
 * License along with this library.
 * If not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_QUATERNION_H_}
{$define EINA_QUATERNION_H_}
{*
 * @defgroup Eina_Quaternion_Group Quaternion
 * @ingroup Eina_Containers_Group
 *
 * @
  }
type
  PEina_Quaternion = ^TEina_Quaternion;
  TEina_Quaternion = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
      w : Tdouble;
    end;

  PEina_Quaternion_F16p16 = ^TEina_Quaternion_F16p16;
  TEina_Quaternion_F16p16 = record
      x : TEina_F16p16;
      y : TEina_F16p16;
      z : TEina_F16p16;
      w : TEina_F16p16;
    end;

  PEina_Point_3D = ^TEina_Point_3D;
  TEina_Point_3D = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;

  PEina_Point_3D_F16p16 = ^TEina_Point_3D_F16p16;
  TEina_Point_3D_F16p16 = record
      x : TEina_F16p16;
      y : TEina_F16p16;
      z : TEina_F16p16;
    end;


procedure eina_quaternion_f16p16_set(out:PEina_Quaternion; x:TEina_F16p16; y:TEina_F16p16; z:TEina_F16p16; w:TEina_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
function eina_quaternion_f16p16_norm(q:PEina_Quaternion_F16p16):TEina_F16p16;cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_f16p16_negative(out:PEina_Quaternion_F16p16; in:PEina_Quaternion_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_f16p16_add(out:PEina_Quaternion_F16p16; a:PEina_Quaternion_F16p16; b:PEina_Quaternion_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_f16p16_mul(out:PEina_Quaternion_F16p16; a:PEina_Quaternion_F16p16; b:PEina_Quaternion_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_f16p16_scale(out:PEina_Quaternion_F16p16; a:PEina_Quaternion_F16p16; b:TEina_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_f16p16_conjugate(out:PEina_Quaternion_F16p16; in:PEina_Quaternion_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_quaternion_f16p16_dot(a:PEina_Quaternion_F16p16; b:PEina_Quaternion_F16p16):TEina_F16p16;cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_f16p16_lerp(out:PEina_Quaternion_F16p16; a:PEina_Quaternion_F16p16; b:PEina_Quaternion_F16p16; pos:TEina_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_f16p16_slerp(out:PEina_Quaternion_F16p16; a:PEina_Quaternion_F16p16; b:PEina_Quaternion_F16p16; pos:TEina_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_f16p16_nlerp(out:PEina_Quaternion_F16p16; a:PEina_Quaternion_F16p16; b:PEina_Quaternion_F16p16; pos:TEina_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_f16p16_rotate(p:PEina_Point_3D_F16p16; center:PEina_Point_3D_F16p16; q:PEina_Quaternion_F16p16);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_f16p16_rotation_matrix3_get(m:PEina_Matrix3_F16p16; q:PEina_Quaternion_F16p16);cdecl;external;
{*< @since 1.15  }
procedure eina_quaternion_set(q:PEina_Quaternion; x:Tdouble; y:Tdouble; z:Tdouble; w:Tdouble);cdecl;external;
(* Const before type ignored *)
function eina_quaternion_norm(q:PEina_Quaternion):Tdouble;cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_negative(out:PEina_Quaternion; in:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_add(out:PEina_Quaternion; a:PEina_Quaternion; b:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_mul(out:PEina_Quaternion; a:PEina_Quaternion; b:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_scale(out:PEina_Quaternion; a:PEina_Quaternion; b:Tdouble);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_conjugate(out:PEina_Quaternion; in:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_quaternion_dot(a:PEina_Quaternion; b:PEina_Quaternion):Tdouble;cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_normalized(out:PEina_Quaternion; in:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_lerp(out:PEina_Quaternion; a:PEina_Quaternion; b:PEina_Quaternion; pos:Tdouble);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_slerp(out:PEina_Quaternion; a:PEina_Quaternion; b:PEina_Quaternion; pos:Tdouble);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_nlerp(out:PEina_Quaternion; a:PEina_Quaternion; b:PEina_Quaternion; pos:Tdouble);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_rotate(p:PEina_Point_3D; center:PEina_Point_3D; q:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_quaternion_rotation_matrix3_get(m:PEina_Matrix3; q:PEina_Quaternion);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
procedure eina_matrix3_quaternion_get(q:PEina_Quaternion; m:PEina_Matrix3);cdecl;external;
{*< @since 1.15  }
(* Const before type ignored *)
function eina_matrix4_quaternion_to(rotation:PEina_Quaternion; perspective:PEina_Quaternion; translation:PEina_Point_3D; scale:PEina_Point_3D; skew:PEina_Point_3D; 
           m:PEina_Matrix4):TEina_Bool;cdecl;external;
{*< @since 1.16  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_matrix4_to(m:PEina_Matrix4; rotation:PEina_Quaternion; perspective:PEina_Quaternion; translation:PEina_Point_3D; scale:PEina_Point_3D; 
            skew:PEina_Point_3D);cdecl;external;
{*< @since 1.16  }
{*
 * @brief Compute the inverse of the given quaternion.
 *
 * @param[out] out The quaternion to invert.
 * @param[in] q The quaternion matrix.
 *
 * This function inverses the quaternion @p q and stores the result in
 * @p out.
 *
 * @since 1.17
  }
(* Const before type ignored *)
procedure eina_quaternion_inverse(out:PEina_Quaternion; q:PEina_Quaternion);cdecl;external;
{*
 * @brief Set array to quaternion.
 *
 * @param[out] dst The result quaternion
 * @param[in] v The the array[4] for set
 *
 * Set to quaternion first 4 elements from array
 *
 * @since 1.17
  }
(* Const before type ignored *)
procedure eina_quaternion_array_set(dst:PEina_Quaternion; v:Pdouble);cdecl;external;
{*
 * @brief Copy quaternion.
 *
 * @param[out] dst The quaternion copy
 * @param[in] src The quaternion for copy.
 *
 * @since 1.17
  }
(* Const before type ignored *)
procedure eina_quaternion_copy(dst:PEina_Quaternion; src:PEina_Quaternion);cdecl;external;
{*
 * @brief Homogeneous quaternion
 *
 * @param[out] out The resulting quaternion
 * @param[in] v The given quaternion
 *
 * @since 1.17
  }
(* Const before type ignored *)
procedure eina_quaternion_homogeneous_regulate(out:PEina_Quaternion; v:PEina_Quaternion);cdecl;external;
{*
 * @brief Subtract two quaternions
 *
 * @param[out] out The resulting quaternion
 * @param[in] a The first member of the subtract
 * @param[in] b The second member of the subtract
 *
 * @since 1.17
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_subtract(out:PEina_Quaternion; a:PEina_Quaternion; b:PEina_Quaternion);cdecl;external;
{*
 * @brief Return the length of the given quaternion.
 *
 * @param[out] v The quaternion.
 * @return The length.
 *
 * @since 1.17
  }
(* Const before type ignored *)
function eina_quaternion_length_get(v:PEina_Quaternion):Tdouble;cdecl;external;
{*
 * @brief Return the length in square of the given quaternion.
 *
 * @param[out] v The quaternion.
 * @return The length in square.
 *
 * @since 1.17
  }
(* Const before type ignored *)
function eina_quaternion_length_square_get(v:PEina_Quaternion):Tdouble;cdecl;external;
{*
 * @brief Return the distance between of two quaternions.
 *
 * @param[in] a The first quaternion.
 * @param[in] b The second quaternion.
 * @return The distance.
 *
 * @since 1.17
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_quaternion_distance_get(a:PEina_Quaternion; b:PEina_Quaternion):Tdouble;cdecl;external;
{*
 * @brief Return the distance in square between of two quaternions.
 *
 * @param[in] a The first quaternion.
 * @param[in] b The second quaternion.
 * @return The distance in square.
 *
 * @since 1.17
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_quaternion_distance_square_get(a:PEina_Quaternion; b:PEina_Quaternion):Tdouble;cdecl;external;
{*
 * @brief Transform quaternion.
 *
 * @param[out] out The result quaternion.
 * @param[in] v The quaternion for transform.
 * @param[in] m The matrix for transform.
 *
 * @since 1.17
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eina_quaternion_transform(out:PEina_Quaternion; v:PEina_Quaternion; m:PEina_Matrix4);cdecl;external;
{*
 * @brief Return the angle plains between of two quaternions.
 *
 * @param[in] a The first quaternion.
 * @param[in] b The second quaternion.
 * @return The angle.
 *
 * @since 1.17
  }
function eina_quaternion_angle_plains(a:PEina_Quaternion; b:PEina_Quaternion):Tdouble;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
