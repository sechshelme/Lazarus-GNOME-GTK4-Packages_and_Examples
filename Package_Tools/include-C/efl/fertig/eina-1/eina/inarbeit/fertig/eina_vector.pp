
unit eina_vector;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_vector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_vector.h
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
PEina_Vector2  = ^Eina_Vector2;
PEina_Vector3  = ^Eina_Vector3;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2016 Sergey Osadchy
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
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_VECTOR_H_}
{$define EINA_VECTOR_H_}
{$include "eina_matrix.h"}
{$include "eina_quaternion.h"}
{*
 * @file
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_Vector2 Floating point vectors in 2D
 * @brief 2D vector definition and operations
 * @
  }
type
  PEina_Vector2 = ^TEina_Vector2;
  TEina_Vector2 = record
      x : Tdouble;
      y : Tdouble;
    end;

{*
 * @brief Set parameters to vector.
 *
 * @param[out] dst The resulting vector.
 * @param[in] x The x component.
 * @param[in] y The y component.
 *
 * @since 1.17
  }
{*
 * @brief Make negative vector.
 *
 * @param[out] out The resulting vector.
 * @param[in] v The current vector.
 *
 * @since 1.17
  }
{*
 * @brief Subtract two vectors
 *
 * @param[out] out The resulting vector
 * @param[in] a The first member of the subtract
 * @param[in] b The second member of the subtract
 *
 * @since 1.17
  }
{* @  }
{*
 * @defgroup Eina_Vector3 Floating point vectors in 3D
 * @brief 3D vector definition and operations
 * @
  }
  PEina_Vector3 = ^TEina_Vector3;
  TEina_Vector3 = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;

{*
 * @brief Set parameters to vector.
 *
 * @param[out] dst The resulting vector.
 * @param[in] x The x component.
 * @param[in] y The y component.
 * @param[in] z The z component.
 *
 * @since 1.18
  }
{*
 * @brief Multiply two vectors
 *
 * @param[out] out The resulting vector
 * @param[in] a The first member
 * @param[in] b The second member
 *
 * @since 1.18
  }
{*
 * @brief Return the angle between of two vectors.
 *
 * @param[in] a The first vector.
 * @param[in] b The second vector.
 * @return The angle.
 *
 * @since 1.18
  }
{* @  }
{* @  }
{$include "eina_inline_vector.x"}
{$endif}

implementation


end.
