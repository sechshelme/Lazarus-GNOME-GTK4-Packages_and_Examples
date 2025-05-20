
unit eina_fp;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_fp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_fp.h
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
PEina_F16p16  = ^Eina_F16p16;
PEina_F32p32  = ^Eina_F32p32;
PEina_F8p24  = ^Eina_F8p24;
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2007-2008 Jorge Luis Zapata Muga
 * Copyright (C) 2009 Cedric BAIL
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
{$ifndef EINA_FP_H_}
{$define EINA_FP_H_}
{*
 * @addtogroup Eina_Fp_Group Fp
 *
 * @brief Floating point numbers data type management.
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_Fp_Group Fp
 *
 * @
  }
{$include "eina_types.h"}
{$ifdef _MSC_VER}
type
  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;

  Pint64_t = ^Tint64_t;
  Tint64_t = int64;

  Pint32_t = ^Tint32_t;
  Tint32_t = longint;
{$else}
{$include <stdint.h>}
{$endif}
{*
 * @def EINA_F32P32_PI
 * @brief Yields the 32-bit PI constant
  }

const
  EINA_F32P32_PI = $00000003243f6a89;  
{*
 * @typedef Eina_F32p32
 * Type for floating point number where the size of the integer part is 32-bit
 * and the size of the decimal part is 32-bit
  }
type
  PEina_F32p32 = ^TEina_F32p32;
  TEina_F32p32 = Tint64_t;
{*
 * @typedef Eina_F16p16
 * Type for floating point number where the size of the integer part is 16-bit
 * and the size of the decimal part is 16-bit
  }

  PEina_F16p16 = ^TEina_F16p16;
  TEina_F16p16 = Tint32_t;
{*
 * @typedef Eina_F8p24
 * Type for floating point number where the size of the integer part is 8-bit
 * and the size of the decimal part is 24bits
  }

  PEina_F8p24 = ^TEina_F8p24;
  TEina_F8p24 = Tint32_t;
{*
 * @brief Creates a new Eina_F32p32 floating point number from standard 32-bit
 * integer
 *
 * @param[in] v 32-bit integer value to convert
 * @return The value converted into Eina_F32p32 format
  }
{*
 * @brief Gets the absolute value of an Eina_F32p32 floating point number
 *
 * @param[in] a The floating point number
 * @return The absolute value for the number @p a
 * @warning Has known issues on 64-bit architecture, prefer
 * eina_f32p32_fracc_get() instead
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function eina_fp32p32_llabs(a : longint) : longint;

{*
 * @brief Calculates the cosine of a floating point number
 *
 * @param[in] a The angle in radians to calculate the cosine from.
 * @return The cosine of the angle @p a
  }
function eina_f32p32_cos(a:TEina_F32p32):TEina_F32p32;cdecl;external;
{*
 * @brief Calculates the sine of a floating point number
 *
 * @param[in] a The angle in radians to calculate the sine from.
 * @return The cosine of the angle @p a
  }
function eina_f32p32_sin(a:TEina_F32p32):TEina_F32p32;cdecl;external;
{*
 * @def EINA_F16P16_ONE
 *
 * Yields the maximum 16-bit unsigned integer size (= 65536)
  }
const
  EINA_F16P16_ONE = 1 shl 16;  
{*
 * @def EINA_F16P16_HALF
 *
 * Yields the maximum 16-bit signed integer size (= 32768)
  }
  EINA_F16P16_HALF = 1 shl 15;  
{*
 * @brief Creates a new Eina_F16p316 floating point number from standard 32-bit
 * integer
 *
 * @param[in] v 32-bit integer value to convert
 * @return The value converted into Eina_F16p16 format
  }
{*
 * @brief Creates a new Eina_F16p16 floating point number from standard float
 *
 * @param[in] v Float value to convert
 * @return The value converted into Eina_F16p16 format
  }
{$include "eina_inline_f32p32.x"}
{$include "eina_inline_f16p16.x"}
{$include "eina_inline_f8p24.x"}
{$include "eina_inline_fp.x"}
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_fp32p32_llabs(a : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if a<0 then
    if_local1:=-(a)
  else
    if_local1:=a;
  eina_fp32p32_llabs:=if_local1;
end;


end.
