
unit eina_cpu;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_cpu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_cpu.h
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
PEina_Cpu_Features  = ^Eina_Cpu_Features;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2007-2008 Jorge Luis Zapata Muga
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
{$ifndef EINA_CPU_H_}
{$define EINA_CPU_H_}
{*
 * @addtogroup Eina_Cpu_Group Cpu
 *
 * @brief Cpu and architecture related helpers
  }
{*
 * @addtogroup Eina_Tools_Group Tools
 *
 * @
  }
{*
 * @defgroup Eina_Cpu_Group Cpu
 *
 * @
  }
{$include "eina_types.h"}
{*
 * @typedef Eina_Cpu_Features
 * Enumerates different hardware architectures.
  }
{*< Multimedia Extensions (Intel)  }
{*< Streaming SIMD Extensions (Intel)  }
{*< Streaming SIMD Extensions 2 (Intel)  }
{*< Streaming SIMD Extensions 3 (Intel)  }
{ TODO 3DNow!  }
{*< Single-precision floating point and integer SIMD (PowerPC)  }
{*< Visual Instruction Set (Spark)  }
{*< Advanced SIMD Extension (ARM)  }
{*< Supplemental Streaming SIMD Extension 3 (Intel)  }
{*< Streaming SIMD Extension 4.1 (Intel)  }
{*< Streaming SIMD Extension 4.2 (Intel)  }
{*< Scalable Vector Extension (ARM)  }
type
  PEina_Cpu_Features = ^TEina_Cpu_Features;
  TEina_Cpu_Features =  Longint;
  Const
    EINA_CPU_MMX = $00000001;
    EINA_CPU_SSE = $00000002;
    EINA_CPU_SSE2 = $00000004;
    EINA_CPU_SSE3 = $00000008;
    EINA_CPU_ALTIVEC = $00000010;
    EINA_CPU_VIS = $00000020;
    EINA_CPU_NEON = $00000040;
    EINA_CPU_SSSE3 = $00000080;
    EINA_CPU_SSE41 = $00000100;
    EINA_CPU_SSE42 = $00000200;
    EINA_CPU_SVE = $00000400;
;
{*
 * @brief Global hardware architecture handler.
 *
 * @return the current cpu features
  }
  var
    eina_cpu_features : TEina_Cpu_Features;cvar;external;
{*
 * @brief Cpu features accessor.
 *
 * @return the current cpu features
  }

function eina_cpu_features_get:TEina_Cpu_Features;cdecl;external;
{*
 * @brief Gets the current number of processors.
 *
 * @return The number of processors that are online, that
 * is available when the function is called.
  }
function eina_cpu_count:longint;cdecl;external;
{*
 * @brief Gets the current virtual page size.
 *
 * @return The fixed length that represents the smallest unit of data for memory
 * allocation performed by the operating system on behalf of the program, and
 * for transfers between the main memory and any other auxiliary store.
  }
function eina_cpu_page_size:longint;cdecl;external;
{*
 * @brief Reverses the byte order of a 16-bit (destination) register.
 *
 * @param[in] x The binary word to swap
 * @return A byte order swapped 16-bit integer.
 *
 * On big endian systems, the number is converted to little endian byte order.
 * On little endian systems, the number is converted to big endian byte order.
  }
{*
 * @brief Reverses the byte order of a 64-bit (destination) register.
 *
 * @param[in] x The binary word to swap
 * @return A byte order swapped 64-bit integer.
 *
 * On big endian systems, the number is converted to little endian byte order.
 * On little endian systems, the number is converted to big endian byte order.
  }
{$ifndef MIN}
{* Returns the minimum of the two parameters
 * @warning Beware of side effects, since the returned parameter is evaluated
 * twice.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MIN(x,y : longint) : longint;

{$endif}
{$ifndef MAX}
{* Returns the maximum of the two parameters
 * @warning Beware of side effects, since the returned parameter is evaluated
 * twice.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MAX(x,y : longint) : longint;

{$endif}
{$include "eina_inline_cpu.x"}
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_CPU_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MIN(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if x>y then
    if_local1:=y
  else
    if_local1:=x;
  MIN:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MAX(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if x>y then
    if_local1:=x
  else
    if_local1:=y;
  MAX:=if_local1;
end;


end.
